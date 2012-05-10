# encoding: UTF-8
require 'fileutils'

module Hookers
  module Git
    extend self

    def root_path
      path = Dir.pwd

      while (path != "/") and ! Dir.entries(path).include?(".git") do
        path = File.expand_path("..", path)
      end
      path
    end

    def setup
      from_path = "#{Hookers.root}/scripts/git/post-commit"
      to_path = "#{root_path}/.git/hooks/post-commit"

      FileUtils.cp(from_path, to_path)
      FileUtils.chmod 0755, to_path

      "setup successfully"
    end
  end
end
