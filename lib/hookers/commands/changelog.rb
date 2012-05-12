# encoding: UTF-8

module Hookers
  module Commands
    class Changelog
      include Hookers::Command

      def self.slop
        Slop.new(help: true, banner: "Generates changelogs based on commit messages") do
          on :from, "Generate changelog from this refence", argument: true
          on :to, "Generate changelog up to this reference", argument: true
          on :setup, "Copy git hooks files to project .git/hooks ", argument: true
        end
      end

      attr_accessor :options

      def initialize(command, args)
        self.options = parse_options(args)
      end

      def run
        puts Hookers::Changelog::Changelogger.new.generate(options)
      end
    end
  end
end
