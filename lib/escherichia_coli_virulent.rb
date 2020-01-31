# frozen_string_literal: true
require_relative 'escherichia_coli'

class EscherichiaColiVirulent < EscherichiaColi
  def initialize(strain)
    super(strain)
  end

  def increase_pathogenicity
    add_symptom(:shiga_toxin_production)
    increase_lethality(2)
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    Especially virulent strains of E.coli such as strain:#{@strain} produce Shiga Toxin, which increases the damage done by E.coli to the host.\n"
  end
end
