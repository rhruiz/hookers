# encoding: UTF-8

module Hookers
  module Commands
    class Help
      include Hookers::Command

      attr_accessor :args

      def initialize(command, args)
        self.args = args
      end

      def run
        if args.length == 0 || Hookers.commands[args[0]] == nil
          puts "Use hookers help <command> for additional options\nAvailable commands: "
          Hookers.commands.keys.each { |k| puts "\t#{k}" }
          return
        end

        if Hookers.commands[args[0]] && Hookers.commands[args[0]].respond_to?(:slop)
          puts Hookers.commands[args[0]].slop.help
        end
      end
    end
  end
end
