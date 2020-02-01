# frozen_string_literal: true
require_relative 'staphylococcus_aureus'

class StaphylococcusAureusMRSA < StaphylococcusAureus
  def initialize(strain)
    super(strain)
    @resistant_to << :Methycillin
    @symptoms << :respiratory_infections << :sores
    @cost_of_treatment = 45
    @lethality = 9
  end

  def increase_pathogenicity
    super
    # loop through all available treatments and add to the resistant to array, if not already present
    BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS.each do |treatment|
      @resistant_to << treatment unless @resistant_to.include?(treatment)
    end
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    MRSA is one of the most dangerous modern infections. Usually hospital acquired it is resistant "
    str += "to nearly all known antibiotics and usually fatal.\n"
    str
  end
end
