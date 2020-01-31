# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DiagnoseSymptoms < Biocontainmentfacility::Command
      def call(_args, _name)
        raise ArgumentError, 'You must enter at least 1 number' if _args.empty?
        # create ui
        ui = UI.new
        limit = ui.get_num_symptoms
        choices = _args.map(&:to_i)
        choices.each do |choice|
          raise ArgumentError, "Each choice must be a number from 1 to #{limit}" unless choice.between?(1, limit)
        end
        # display a summary of this chosen organisms
        ui.diagnose_symptoms(choices.map { |e| e - 1 })
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        ui = UI.new
        str = ""
        str += "Displays summarized information on organisms which may cause the chosen symptoms. You may choose 1 or more symptoms from the list ro narrow your search.\nUsage: {{command:#{Biocontainmentfacility::TOOL_NAME} diagnose_symptoms}} number [..number number] (e.g. 19 2)"
        str += "\n\n#{ui.get_symptom_list_with_keys}"
      end
    end
  end
end
