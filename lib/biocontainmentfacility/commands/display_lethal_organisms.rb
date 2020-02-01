# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplayLethalOrganisms < Biocontainmentfacility::Command
      def call(args, _name)
        raise ArgumentError, 'You must enter 1 number' if args.size != 1
        # create ui
        ui = UI.new
        choice = args[0].to_i
        raise ArgumentError, "You must enter a number greater than 0" unless choice > 0
        ui.display_lethal_organisms(choice)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        str = "Displays all organisms with greater than or equal to the chosen lethality.\n"
        str += "Usage: {{command:#{Biocontainmentfacility::TOOL_NAME} display_lethal_organisms}} number (e.g. 9)"
        str
      end
    end
  end
end
