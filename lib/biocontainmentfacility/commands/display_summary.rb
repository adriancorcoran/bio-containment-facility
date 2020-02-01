# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplaySummary < Biocontainmentfacility::Command
      def call(args, _name)
        raise ArgumentError, 'You must enter 1 number' if args.size != 1
        # create ui
        ui = UI.new
        limit = ui.num_organisms
        choice = args[0].to_i
        raise ArgumentError, "You must enter a number from 1 to #{limit}" unless choice.between?(1, limit)
        # display a summary of this chosen organisms (account for 0 index)
        ui.display_summary(choice - 1)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        ui = UI.new
        str = ""
        str += "Displays summarized information on the chosen organism.\nUsage: "
        str += "{{command:#{Biocontainmentfacility::TOOL_NAME} display_summary}} number (e.g. 3)"
        str += "\n\n#{ui.organism_list_with_keys}"
        str
      end
    end
  end
end
