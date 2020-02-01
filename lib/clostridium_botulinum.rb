# frozen_string_literal: true
require_relative 'gram_positive_bacteria'

class ClostridiumBotulinum < GramPositiveBacteria
  def initialize(strain)
    super(strain)
    @shape = :round
    @resistant_to << :Amoxicillin
    @teichoic_acid_type = 7
    @symptoms << :fever
    @cost_of_treatment = 25
    @lethality = 0
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    The powerful botulism toxin produced by Clostridium Botulinum can completely immobilise most "
    str += "large animals.\n"
    str
  end
end
