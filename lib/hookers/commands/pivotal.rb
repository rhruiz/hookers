# encoding: UTF-8

module Hookers
  module Commands
    class Pivotal
      include Hookers::Command

      attr_accessor :options

      def initialize(options = {})
        self.options = options
      end

      def run
        puts Hookers::Pivotal::TrackerProject.new(options[:"api-token"]).notify_changes
      end
    end
  end
end