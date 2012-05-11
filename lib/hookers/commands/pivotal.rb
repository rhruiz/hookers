# encoding: UTF-8

module Hookers
  module Commands
    class Pivotal
      include Hookers::Command

      attr_accessor :options

      def self.slop
        Slop.new(help: true) do
          on :"api-token", "Pivotal user token to sync commits", argument: true
        end
      end

      def initialize(command, args)
        self.class.slop.parse(args)
        self.options = self.class.slop.to_hash
      end

      def run
        puts Hookers::Pivotal::TrackerProject.new(options[:"api-token"]).notify_changes
      end
    end
  end
end
