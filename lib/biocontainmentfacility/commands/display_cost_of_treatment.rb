# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplayCostOfTreatment < Biocontainmentfacility::Command
      def call(_args, _name)
        raise ArgumentError, 'You must enter 1 number' if _args.size != 1
        # create ui
        ui = UI.new
        choice = _args[0].to_i
        raise ArgumentError, "You must enter a number greater than 0" unless choice > 0
        ui.display_cost_of_treatment(choice)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        "Displays the cost of treating all the organisms in the catalogue, for the given number of cases.\nUsage: {{command:#{Biocontainmentfacility::TOOL_NAME} display_cost_of_treatment}} number (e.g. 500)"
      end
    end
  end
end
