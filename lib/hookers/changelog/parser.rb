# encoding: UTF-8

module Hookers
  module Changelog
    class Parser
      attr_accessor :project, :message

      REGEXP = /\[(bug|feature|story|fixed|fixes|completed|finished|delivers)((?:\s+#\s*\d+){1,})\]/i
      SUBPATTERN = /(?:\s+\#\s*(\d+))/

      def initialize(project)
        self.project = project
      end

      def parse(line)
        id, message = line.split(" ", 2)
        data = message.scan(Parser::REGEXP)
        affects = []
        commit = Commit.new(project, id, message)

        if !data.nil?
          data.each do |type, identifiers|
            identifiers.scan(Parser::SUBPATTERN).flatten.each do |number|
              affects << Affects.new(commit, type.upcase, number)
            end
          end
        end

        affects
      end
    end
  end
end

