# encoding: UTF-8

require 'stringio'

module Hookers
  module Changelog
    class Changelogger
      def initialize(project = Project.discover)
        @project = project
      end

      def generate(options = {})
        from = options[:from] || History.first
        to = options[:to] || "HEAD"
        lines = History.between(from, to)
        parser = Parser.new(@project)
        commits = lines.map { |e| parser.parse(e) }.flatten.group_by(&:identifier)

        output = StringIO.new

        output.puts "Historias e bugs:"
        commits.each_pair do |identifier, commits|
          output.puts "\n * #{identifier}: - #{commits.first.uri}"
          commits.each do |affected|
            output.puts "   - #{affected.commit.message} - #{affected.commit.uri}"
          end
        end

        output.rewind
        output.read
      end
    end
  end
end
