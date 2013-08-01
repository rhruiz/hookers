# encoding: utf-8

module Hookers
  module Changelog
    module Matchers
      class Matcher 
        attr_accessor :number, :commit, :type
        SUBPATTERN = /(?:\s+\#\s*(\d+))/

        def self.scan(commit)
          []
        end

        def identifier
          "#{type} ##{number}"
        end

        def initialize(commit, type, number)
          self.commit = commit
          self.type = type
          self.number = number
        end

        def uri
          nil
        end

        def type
          @type.upcase if @type
        end

        def to_affected
          Hookers::Changelog::Affects.new(commit, type, number, uri, identifier)
        end
    
        def self.blocks_of(commit, regexp, subpattern = nil)
          results = []

          commit.message.scan(/(\[(?:#{regexp}\s*)+\])/i).each do |e|
            if subpattern
              results += e[2].scan(subpattern).map { |sub| [e[1], sub[0]] }
            else
              results << e.slice(1..2)
            end
          end

          results
        end
      end

      class ServiceNowMatcher < Matcher
        def self.scan(commit)
          blocks_of(commit, /(INC|PRB|TICKET|CHG)(\d+)/).map { |e| new(commit, *e) }
        end

        def uri
          uris = {"chg" => "change_request_list", "inc" => "incident_list", "prb" => "problem_list"}

          "https://lwprod.service-now.com/nav_to.do?uri=#{uris.fetch(@type.to_s.downcase)}.do?sysparm_query=number%3D#{identifier}"
        end

        def type
          {"chg" => "CHANGE"}.fetch(@type.to_s.downcase, @type.to_s)
        end

        def identifier
          "#{@type}#{number}"
        end
      end
    
      class BugzillaMatcher < Matcher
        REGEXP = /(bug)((?:\s+#\s*\d+){1,})/i
        SUBPATTERN = /(?:\s+\#\s*(\d+))/
      
        def self.scan(commit)
          blocks_of(commit, REGEXP, SUBPATTERN).map { |e| new(commit, *e) }
        end

        def uri
          "http://bugzilla-qa.linux.locaweb.com.br/show_bug.cgi?id=#{number}"
        end
      end

      class PivotalTrackerMatcher < Matcher
        REGEXP = /(feature|story|fixed|fixes|completed|finished|delivers)((?:\s+#\s*\d+){1,})/i
        SUBPATTERN = /(?:\s+\#\s*(\d+))/

        def self.scan(commit)
          blocks_of(commit, REGEXP, SUBPATTERN).map { |e| new(commit, *e) }
        end

        def type
          "FEATURE"
        end

        def uri
          "http://pivotaltracker.com/story/show/#{self.number}"
        end
      end
    end
  end
end
