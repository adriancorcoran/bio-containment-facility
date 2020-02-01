# frozen_string_literal: true
require_relative 'virus'

class HIV < Virus
  def initialize(strain)
    super(strain)
    @rna_or_dna = :rna
    @single_stranded = true
    @symptoms << :swelling_of_lymph_nodes << :weakness
    @cost_of_treatment = 50
    @lethality = 8
  end

  def increase_pathogenicity
    add_symptom(:compromised_immune_system)
    increase_lethality(1)
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    The HIV virus destroys the host immune system, often resulting in death from opportunistic "
    str += "infections by normally benign organisms.\n"
    str
  end
end
