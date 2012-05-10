require "hookers/version"
require "hookers/command"

require "hookers/changelog/project"
require "hookers/changelog/affects"
require "hookers/changelog/changelogger"
require "hookers/changelog/commit"
require "hookers/changelog/history"
require "hookers/changelog/parser"
require "hookers/commands/changelog"

require "hookers/pivotal/pivotal"

require "slop"

module Hookers
  def self.run!(command, options = {})
    if commands.key?(command)
      commands[command].new(options).run
    end
  end
end
