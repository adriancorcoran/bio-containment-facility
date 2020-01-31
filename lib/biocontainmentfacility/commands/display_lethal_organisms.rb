# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplayLethalOrganisms < Biocontainmentfacility::Command
      def call(_args, _name)
        raise ArgumentError, 'You must enter 1 number' if _args.size != 1
        # create ui
        ui = UI.new
        choice = _args[0].to_i
        raise ArgumentError, "You must enter a number greater than 0" unless choice > 0
        ui.display_lethal_organisms(choice)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        "Displays all organisms with greater than or equal to the chosen lethality.\nUsage: {{command:#{Biocontainmentfacility::TOOL_NAME} display_lethal_organisms}} number (e.g. 9)"
      end
    end
  end
end
