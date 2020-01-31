# frozen_string_literal: true
require_relative 'virus'

class Ebola < Virus
  def initialize(strain)
    super(strain)
    @rna_or_dna = :rna
    @single_stranded = true
    @symptoms << :fever << :headache << :joint_muscle_aches << :sore_throat
    @cost_of_treatment = 25
    @lethality = 9
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    During replication the Ebola virus will often burst the host cell, leading to massive hemorrhage and death.\n"
  end
end
