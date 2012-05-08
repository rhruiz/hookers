# encoding: UTF-8

module Hookers
  module Changelog
    class Project
      attr_accessor :name, :uri

      def initialize(name, uri)
        self.name = name
        self.uri = uri
      end

      def commit_uri(id)
        "#{self.uri}/commit/#{id}"
      end

      def self.discover
        remote_uri = %x[git remote -v].split(/\n/).first.split(/\s+/).at(1)

        return nil if remote_uri.nil?
        remote_uri.gsub!(/(git@|git:\/\/)/, "http://")
        remote_uri.gsub!(/:(?!\/\/)/, "/")
        remote_uri.gsub!(/\.git$/, "")
        name = remote_uri.split(/\//).at(-1)
        new(name, remote_uri)
      end
    end
  end
end
