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
	extend self

	def root
		File.expand_path '../..', __FILE__
	end

	def self.run!(command, options = {})
	  commands[command].new(options).run if commands.key?(command)
	end
end
