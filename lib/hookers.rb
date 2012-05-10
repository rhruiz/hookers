require "hookers/version"
require "hookers/command"

require "hookers/changelog"
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
