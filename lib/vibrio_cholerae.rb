# frozen_string_literal: true
require_relative 'gram_negative_bacteria'

class VibrioCholerae < GramNegativeBacteria
  def initialize(strain)
    super(strain)
    @shape = :comma
    @resistant_to << :Gentamicin
    @lps_type = :C
    @symptoms << :diarrhoea << :vomiting
    @cost_of_treatment = 15
    @lethality = 3
  end
end
