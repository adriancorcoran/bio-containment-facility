# frozen_string_literal: true
# common test helper file
require 'test_helper'

class YersiniaPestisResistancePlasmidTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("YersiniaPestisResistancePlasmid")[0]["strain"]
    # create object
    @organism = YersiniaPestisResistancePlasmid.new(@strain)
  end

  def test_increase_pathogenicity_confers_resistance_to_methicillin
    @organism = YersiniaPestisResistancePlasmid.new(@strain)
    refute_includes(@organism.resistant_to, :Methicillin, "resistant_to should not include :Methicillin")
    @organism.increase_pathogenicity
    assert_includes(@organism.resistant_to, :Methicillin, "resistant_to should include :Methicillin")
  end

  def test_increase_pathogenicity_confers_resistance_to_gentamicin
    @organism = YersiniaPestisResistancePlasmid.new(@strain)
    refute_includes(@organism.resistant_to, :Gentamicin, "resistant_to should not include :Gentamicin")
    @organism.increase_pathogenicity
    assert_includes(@organism.resistant_to, :Gentamicin, "resistant_to should include :Gentamicin")
  end

  def test_increase_pathogenicity_confers_resistance_to_tetracycline
    @organism = YersiniaPestisResistancePlasmid.new(@strain)
    refute_includes(@organism.resistant_to, :Tetracycline, "resistant_to should not include :Tetracycline")
    @organism.increase_pathogenicity
    assert_includes(@organism.resistant_to, :Tetracycline, "resistant_to should include :Tetracycline")
  end

  def test_increase_pathogenicity_increases_lethality
    @organism = YersiniaPestisResistancePlasmid.new(@strain)
    lethality_before = @organism.lethality
    @organism.increase_pathogenicity
    assert_operator(@organism.lethality, :>, lethality_before, "increase_pathogenicity() should increase lethality")
  end
end
