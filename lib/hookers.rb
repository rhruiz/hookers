require "hookers/version"
require "hookers/command"
require "hookers/commands/help"

require "hookers/changelog"
require "hookers/pivotal"

require "slop"

module Hookers
	extend self

	def root
		File.expand_path '../..', __FILE__
	end

	def self.run!(command, options = {})
	  commands.fetch(command, Hookers::Commands::Help).new(command, options).run
	end
end
