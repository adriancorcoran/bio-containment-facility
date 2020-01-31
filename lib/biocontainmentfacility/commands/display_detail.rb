# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplayDetail < Biocontainmentfacility::Command
      def call(_args, _name)
        raise ArgumentError, 'You must enter 1 number' if _args.size != 1
        # create ui
        ui = UI.new
        limit = ui.get_num_organisms
        choice = _args[0].to_i
        raise ArgumentError, "You must enter a number from 1 to #{limit}" unless choice.between?(1, limit)
        # display detail of this chosen organisms (account for 0 index)
        ui.display_detail(choice - 1)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        ui = UI.new
        str = ""
        str += "Displays detailed information on the chosen organism.\nUsage: {{command:#{Biocontainmentfacility::TOOL_NAME} display_detail}} number (e.g. 5)"
        str += "\n\n#{ui.get_organism_list_with_keys}"
      end
    end
  end
end
