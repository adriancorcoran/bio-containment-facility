# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplayDetailsAll < Biocontainmentfacility::Command
      def call(_args, _name)
        # create ui
        ui = UI.new
        # display a summary of all the organisms in the catalogue
        ui.display_details_all
      end

      def self.help
        'Displays detailed information on all organisms in the catalogue'
      end
    end
  end
end
