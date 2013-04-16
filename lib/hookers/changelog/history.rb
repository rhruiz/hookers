# encoding: UTF-8

module Hookers
  module Changelog
    class History
      def self.first
        %x[git rev-list --all --reverse | head -1].strip
      end

      def self.between(from, to)
        lines = %x[git log --pretty=oneline #{from}..#{to}].split(/\n/)
      end
    end
  end
end

