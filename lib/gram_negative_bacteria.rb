# frozen_string_literal: true
require_relative 'bacteria'

class GramNegativeBacteria < Bacteria
  def initialize(strain)
    super(strain)
    @gram_negative = true
    @resistant_to << :Vancomycin << :Streptomycin
    @lps_type = nil
  end

  attr_accessor :lps_type

  def display_details
    str = super
    str += "  - LPS Type: #{@lps_type}\n"
    str += line_short
    str += "  - #{describe_symptoms}\n"
    str += line_short
    str += "  - #{describe_resistance}\n"
  end
end
