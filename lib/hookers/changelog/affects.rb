# encoding: UTF-8

module Hookers
  module Changelog
    class Affects
      attr_accessor :commit, :type, :number

      def bug?
        self.type == "BUG"
      end

      def feature?
        self.type == "FEATURE"
      end

      def type=(value)
        @type = (value == "BUG" ? "BUG" : "FEATURE")
      end

      def identifier
        "#{type} ##{number}"
      end

      def uri
        return "http://bugzilla-qa.linux.locaweb.com.br/show_bug.cgi?id=" + self.number if bug?
        return "http://pivotaltracker.com/story/show/" + self.number if feature?
      end

      def initialize(commit, type, number)
        self.commit = commit
        self.type = type
        self.number = number
      end
    end
  end
end
