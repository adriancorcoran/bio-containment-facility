# frozen_string_literal: true
require_relative 'gram_negative_bacteria'

class EscherichiaColi < GramNegativeBacteria
  def initialize(strain)
    super(strain)
    @shape = :rod
    @resistant_to << :Tetracycline
    @lps_type = :A
    @symptoms << :diarrhoea << :abdominal_pain << :fever << :vomiting
    @cost_of_treatment = 20
    @lethality = 1
  end
end
