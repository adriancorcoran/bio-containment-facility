# frozen_string_literal: true
require 'biocontainmentfacility'
require './lib/ui'

module Biocontainmentfacility
  module Commands
    class DisplayViruses < Biocontainmentfacility::Command
      def call(_args, _name)
        # create ui
        ui = UI.new
        # display a summary of all the organisms in the catalogue
        ui.display_viruses
      end

      def self.help
        'Displays summarized information on all viruses in the catalogue'
      end
    end
  end
end
