require "hookers/version"
require "hookers/changelog/project"
require "hookers/changelog/affects"
require "hookers/changelog/changelogger"
require "hookers/changelog/commit"
require "hookers/changelog/history"
require "hookers/changelog/parser"

require "hookers/pivotal/pivotal"

require "hookers/commands/changelog"

require "slop"

module Hookers
  extend self

  def run!(options = {})
    if options[:changelog] != nil
      Hookers::Commands::Changelog.new(options).run
    end
  end
end
