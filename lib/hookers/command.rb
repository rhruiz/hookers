# encoding: UTF-8

module Hookers
  def self.commands
    @@commands ||= {}
  end

  module Command
    def self.included(base)
      Hookers.commands[base.name.gsub(/^Hookers::Commands::/, "").downcase] = base
    end
  end
end
