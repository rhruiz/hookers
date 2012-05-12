# encoding: UTF-8

module Hookers
  def self.commands
    @@commands ||= {}
  end

  module Command
    def self.included(base)
      Hookers.commands[base.name.gsub(/^Hookers::Commands::/, "").downcase] = base
    end
    
    def parse_options(args)
      if self.class.respond_to?(:slop)
        slop = self.class.slop
        slop.parse(args)
        slop.to_hash
      end
    end
  end
end
