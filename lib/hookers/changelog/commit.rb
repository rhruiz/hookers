# encoding: UTF-8

module Hookers
  module Changelog
    class Commit
      attr_accessor :id, :message, :project

      def initialize(project, id, message)
        self.project = project
        self.id = id
        self.message = message
      end

      def uri
        project.commit_uri(self.id)
      end
    end
  end
end
