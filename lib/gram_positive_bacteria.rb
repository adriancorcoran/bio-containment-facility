# frozen_string_literal: true
require_relative 'bacteria'

class GramPositiveBacteria < Bacteria
  def initialize(strain)
    super(strain)
    @gram_negative = false
    @resistant_to << :Chloramphenicol << :Tetracycline
    @teichoic_acid_type = nil
  end

  attr_accessor :teichoic_acid_type

  def display_details
    str = super
    str += "  - Teichoic Acid Type: #{@teichoic_acid_type}\n"
    str += line_short
    str += "  - #{describe_symptoms}\n"
    str += line_short
    str += "  - #{describe_resistance}\n"
    str
  end
end
