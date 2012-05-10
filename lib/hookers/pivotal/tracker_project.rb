# encoding: UTF-8

module Hookers
  module Pivotal
    class TrackerProject
      attr_accessor :token, :base_uri, :git

      def initialize(token)
        raise "Pivotal api token not found" unless token
        self.token = token
        self.git = Git::Repository.new
        self.base_uri = 'http://www.pivotaltracker.com/'
      end

      def commit_uri
        "#{self.base_uri}services/v3/source_commits"
      end

      def notify_changes
        puts "Notifying pivotal tracker of changes..."

        commit = git.last_commit

        response = HttpClient.post(commit_uri, commit.to_xml, { "X-TrackerToken" => self.token, "Content-type" => "application/xml"  })

        puts "Pivotal notified succesfully" if response.code == "200"
      end

    end
  end
end
