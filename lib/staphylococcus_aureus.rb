# frozen_string_literal: true
require_relative 'gram_positive_bacteria'

class StaphylococcusAureus < GramPositiveBacteria
  def initialize(strain)
    super(strain)
    @shape = :round
    @resistant_to << :Penicillin
    @teichoic_acid_type = 6
    @symptoms << :respiratory_infections << :food_poisoning
    @cost_of_treatment = 5
    @lethality = 1
  end

  def increase_pathogenicity
    add_symptom(:abscesses)
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    S. aureus typically infects humans through a cut on their skin, leading to sores and absess formation.\n"
  end
end
