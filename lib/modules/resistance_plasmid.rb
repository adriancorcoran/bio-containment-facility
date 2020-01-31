# frozen_string_literal: true
# contain resistance functions
module ResistancePlasmid
  def increase_pathogenicity_from_plasmid
    add_resistance_to(:Methicillin)
    add_resistance_to(:Gentamicin)
    add_resistance_to(:Tetracycline)
  end

  def add_resistance_to(treatment)
    @resistant_to << treatment
  end
end
