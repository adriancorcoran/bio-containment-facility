# frozen_string_literal: true
require_relative 'gram_negative_bacteria'

class YersiniaPestis < GramNegativeBacteria
  def initialize(strain)
    super(strain)
    @shape = :rod
    @resistant_to << :Penicillin
    @lps_type = :B
    @symptoms << :high_fever << :chills << :headache << :bloody_cough
    @cost_of_treatment = 40
    @lethality = 9
  end

  def increase_pathogenicity
    add_symptom(:plague_symptoms)
    increase_lethality(1)
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    The plague was one of the most famous and widespread pandemics in the middle ages killing an estimated 40% of the global population.\n"
  end
end
