# frozen_string_literal: true
require 'biocontainmentfacility'

module Biocontainmentfacility
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(
      default: 'help',
      contextual_resolver: nil
    )

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :DisplaySummaryAll, 'display_summary_all', 'biocontainmentfacility/commands/display_summary_all'
    register :DisplayDetailsAll, 'display_details_all', 'biocontainmentfacility/commands/display_details_all'
    register :DisplaySummary, 'display_summary', 'biocontainmentfacility/commands/display_summary'
    register :DisplayDetail, 'display_detail', 'biocontainmentfacility/commands/display_detail'
    register :DisplayBacteria, 'display_bacteria', 'biocontainmentfacility/commands/display_bacteria'
    register :DisplayViruses, 'display_viruses', 'biocontainmentfacility/commands/display_viruses'
    register :DisplayLethalOrganisms, 'display_lethal_organisms', 'biocontainmentfacility/commands/display_lethal_organisms'
    register :DisplayCostOfTreatment, 'display_cost_of_treatment', 'biocontainmentfacility/commands/display_cost_of_treatment'
    register :DisplayResistantOrganisms, 'display_resistant_organisms', 'biocontainmentfacility/commands/display_resistant_organisms'
    register :DisplaySusceptibleOrganisms, 'display_susceptible_organisms', 'biocontainmentfacility/commands/display_susceptible_organisms'
    register :DiagnoseSymptoms, 'diagnose_symptoms', 'biocontainmentfacility/commands/diagnose_symptoms'
    # register :Example, 'example', 'biocontainmentfacility/commands/example'
    register :Help, 'help', 'biocontainmentfacility/commands/help'
  end
end
