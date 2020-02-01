# frozen_string_literal: true
require_relative 'virus'

class Smallpox < Virus
  def initialize(strain)
    super(strain)
    @rna_or_dna = :dna
    @single_stranded = false
    @symptoms << :high_fever << :flu_like_symptoms
    @cost_of_treatment = 45
    @lethality = 6
  end

  def increase_pathogenicity
    add_symptom(:pus_filled_sores)
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    Smallpox is a deadly virus which causes painful sores and is responsible for some of historys "
    str += "worst pandemics.\n"
    str
  end
end
