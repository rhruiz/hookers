require "hookers/version"
require "hookers/changelog/project"
require "hookers/changelog/affects"
require "hookers/changelog/changelogger"
require "hookers/changelog/commit"
require "hookers/changelog/history"
require "hookers/changelog/parser"

require "hookers/pivotal/pivotal"

require "slop"

module Hookers
	extend self

	def root
		File.expand_path '../..', __FILE__
	end

	def run!(options = {})
		if options[:changelog] != nil

		end
	end
end
