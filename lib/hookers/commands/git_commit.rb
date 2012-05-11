# encoding: UTF-8

module Hookers
  module Commands
    class GitCommit
      include Hookers::Command

      attr_accessor :options, :command, :git

      KEYS = %w(bug feature story fixed fixes completed finished delivers)

      KEYS.each{|command| Hookers.commands[command] = self } 

      def initialize(command, options = {})
        self.options = options
        self.command = command
        self.git = Git::Repository.new
      end

      def run
        puts git.commit "[#{self.command.upcase} ##{options[:id]}] #{options[:m]}"
      end
    end
  end
end