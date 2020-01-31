# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplayBacteria < Biocontainmentfacility::Command
      def call(_args, _name)
        # create ui
        ui = UI.new
        # display a summary of all the organisms in the catalogue
        ui.display_bacteria
      end

      def self.help
        'Displays summarized information on all bacteria in the catalogue'
      end
    end
  end
end
