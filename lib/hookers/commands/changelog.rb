# encoding: UTF-8

module Hookers
  module Commands
    class Changelog
      include Hookers::Command

      attr_accessor :options

      def initialize(options = {})
        self.options = options
      end

      def run
        puts Hookers::Changelog::Changelogger.new.generate(options)
      end
    end
  end
end
