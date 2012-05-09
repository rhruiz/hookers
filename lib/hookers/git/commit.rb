require "cgi"

module Hookers
  module Git
    class Commit
      attr_accessor :id, :author, :message

      def initialize(id, author, message)
        self.id = id
        self.author = author
        self.message = message
      end

      def to_xml
        "<source_commit>
          <commit_id> #{ self.id } </commit_id>
          <author> #{ CGI::escapeHTML(self.author) } </author>
          <message> #{ CGI::escapeHTML(self.message) } </message>
        </source_commit>"
      end
    end
  end
end