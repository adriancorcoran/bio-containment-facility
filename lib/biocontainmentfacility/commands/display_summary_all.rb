# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplaySummaryAll < Biocontainmentfacility::Command
      def call(_args, _name)
        # create ui
        ui = UI.new
        # display a summary of all the organisms in the catalogue
        ui.display_summary_all
      end

      def self.help
        'Displays summarized information on all organisms in the catalogue'
      end
    end
  end
end
