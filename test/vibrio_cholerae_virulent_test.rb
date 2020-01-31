# frozen_string_literal: true
# common test helper file
require 'test_helper'

class VibrioCholeraeVirulentTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("VibrioCholeraeVirulent")[0]["strain"]
    # create object
    @organism = VibrioCholeraeVirulent.new(@strain)
  end

  def test_strain_is_correct
    assert_equal("O139", @strain, "Strain is not correct")
  end

  def test_increase_pathogenicity_adds_to_symptoms_array
    @organism = VibrioCholeraeVirulent.new(@strain)
    refute_includes(@organism.symptoms, :cholera, "symptoms should not include :cholera")
    @organism.increase_pathogenicity
    assert_includes(@organism.symptoms, :cholera, "symptoms should include :cholera")
  end

  def test_increase_pathogenicity_increases_lethality
    @organism = VibrioCholeraeVirulent.new(@strain)
    lethality_before = @organism.lethality
    @organism.increase_pathogenicity
    assert_operator(@organism.lethality, :>, lethality_before, "increase_pathogenicity() should increase lethality")
  end
end
