# frozen_string_literal: true
require 'biocontainmentfacility'

module Biocontainmentfacility
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = Biocontainmentfacility::Resolver.call(args)
      Biocontainmentfacility::Executor.call(cmd, command_name, args)
    end
  end
end
