# frozen_string_literal: true
require_relative 'gram_positive_bacteria'

class StreptococcusPneumoniae < GramPositiveBacteria
  def initialize(strain)
    super(strain)
    @shape = :round
    @resistant_to << :Penicillin
    @teichoic_acid_type = 3
    @symptoms << :pneumonia << :meningitis
    @cost_of_treatment = 10
    @lethality = 7
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    Streptococci are known for infecting immunocompromised patients such as transplant patients and HIV sufferers.\n"
  end
end
