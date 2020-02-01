# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplayResistantOrganisms < Biocontainmentfacility::Command
      def call(args, _name)
        raise ArgumentError, 'You must enter 1 number' if args.size != 1
        # create ui
        ui = UI.new
        limit = ui.num_treatments
        choice = args[0].to_i
        raise ArgumentError, "You must enter a number from 1 to #{limit}" unless choice.between?(1, limit)
        # display a summary of this chosen organisms (account for 0 index)
        ui.display_resistant_organisms(choice - 1)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        ui = UI.new
        str = ""
        str += "Displays summarized information on organisms which are resistant to the chosen treatment.\n"
        str += "Usage: {{command:#{Biocontainmentfacility::TOOL_NAME} display_resistant_organisms}} number (e.g. 8)"
        str += "\n\n#{ui.treatment_list_with_keys}"
        str
      end
    end
  end
end
