# encoding: UTF-8

module Hookers
  module Changelog
    class History
      def self.since(tag)
        between(tag, "HEAD")
      end

      def self.between(from, to)
        lines = %x[git log --oneline #{from}..#{to}].split(/\n/)
      end
    end
  end
end
