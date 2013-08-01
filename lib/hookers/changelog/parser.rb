# encoding: UTF-8

require "hookers/changelog/matchers"

module Hookers
  module Changelog
    class Parser
      MATCHERS = [:service_now, :bugzilla, :pivotal_tracker]

      attr_accessor :project, :message

      def initialize(project)
        self.project = project
      end

      def get_matcher(name)
        Hookers::Changelog::Matchers.const_get(
          "#{name.to_s.capitalize.gsub(/(_.)/) { |e| e[1].upcase }}Matcher")
      end

      def parse(line)
        id, message = line.split(" ", 2)
        affects = []
        commit = Commit.new(project, id, message)

        matchers = MATCHERS.each do |m|
          affects += get_matcher(m).scan(commit).map(&:to_affected)
        end

        affects
      end
    end
  end
end

