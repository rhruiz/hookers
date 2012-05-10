# encoding: UTF-8

module Hookers
  module Commands
    class Setup
      include Hookers::Command

      attr_accessor :options

      def initialize(options = {})
        self.options = options
      end

      def run
        puts Hookers::Git.setup
      end
    end
  end
end