# frozen_string_literal: true
# common test helper file
require 'test_helper'

class EscherichiaColiVirulentTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("EscherichiaColiVirulent")[0]["strain"]
    # create object
    @organism = EscherichiaColiVirulent.new(@strain)
  end

  def test_strain_is_correct
    assert_equal("O157", @strain, "Strain is not correct")
  end

  def test_increase_pathogenicity_adds_to_symptoms_array
    @organism = EscherichiaColiVirulent.new(@strain)
    refute_includes(@organism.symptoms, :shiga_toxin_production, "symptoms should not include symptom")
    @organism.increase_pathogenicity
    assert_includes(@organism.symptoms, :shiga_toxin_production, "symptoms should include symptom")
  end

  def test_increase_pathogenicity_increases_lethality
    @organism = EscherichiaColiVirulent.new(@strain)
    lethality_before = @organism.lethality
    @organism.increase_pathogenicity
    assert_operator(@organism.lethality, :>, lethality_before, "increase_pathogenicity() should increase lethality")
  end
end
