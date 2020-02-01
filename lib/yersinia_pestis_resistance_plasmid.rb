# frozen_string_literal: true
require_relative 'yersinia_pestis'
require_relative 'modules/resistance_plasmid'

class YersiniaPestisResistancePlasmid < YersiniaPestis
  include ResistancePlasmid

  def initialize(strain)
    super(strain)
  end

  def increase_pathogenicity
    increase_pathogenicity_from_plasmid
    increase_lethality(4)
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    This bacterium contains a plasmid. Plasmids are small pieces of DNA which can be integrated with "
    str += "a bacteria's existing genome to confer additional abilities to the bacteria. This commonly manifests as "
    str += "resistance to a treatment the bacteris was previously susceptible to.\n"
    str
  end
end
