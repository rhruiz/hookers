# encoding: UTF-8

module Hookers
  module Commands
    class GitSetup
      include Hookers::Command

      attr_accessor :options

      Hookers.commands["setup"] = self

      def initialize(command, args)
        self.class.slop.parse(args)
        self.options = self.class.slop.to_hash
      end

      def run
        puts Hookers::Git.setup
      end
    end
  end
end
