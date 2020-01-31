# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplaySusceptibleOrganisms < Biocontainmentfacility::Command
      def call(_args, _name)
        raise ArgumentError, 'You must enter 1 number' if _args.size != 1
        # create ui
        ui = UI.new
        limit = ui.get_num_treatments
        choice = _args[0].to_i
        raise ArgumentError, "You must enter a number from 1 to #{limit}" unless choice.between?(1, limit)
        # display a summary of this chosen organisms (account for 0 index)
        ui.display_susceptible_organisms(choice - 1)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        ui = UI.new
        str = ""
        str += "Displays summarized information on organisms which are susceptible to the chosen treatment.\nUsage: {{command:#{Biocontainmentfacility::TOOL_NAME} display_susceptible_organisms}} number (e.g. 7)"
        str += "\n\n#{ui.get_treatment_list_with_keys}"
      end
    end
  end
end
