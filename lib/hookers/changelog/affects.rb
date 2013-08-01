# encoding: UTF-8

module Hookers
  module Changelog
    class Affects

      attr_accessor :commit, :type, :number, :uri, :identifier

      def initialize(commit, type, number, uri, identifier)
        self.commit = commit
        self.type = type
        self.number = number
        self.uri = uri
        self.identifier = identifier
      end
    end
  end
end
