# encoding: UTF-8

module Hookers
  module Commands
    class GitCommit
      include Hookers::Command

      attr_accessor :options, :command, :git

      KEYS = %w(bug feature story fixed fixes completed finished delivers)

      KEYS.each{|command| Hookers.commands[command] = self }

      def self.slop
        Slop.new(help: true) do
          on :m, "Message to be used on commit", argument: true
          on :id, "Pivotal story id", argument: true
        end
      end

      def initialize(command, args)
        self.class.slop.parse(args)
        self.options = self.class.slop.to_hash
        self.git = Git::Repository.new
      end

      def run
        puts git.commit "[#{self.command.upcase} ##{options[:id]}] #{options[:m]}"
      end
    end
  end
end