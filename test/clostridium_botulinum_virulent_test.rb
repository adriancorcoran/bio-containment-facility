# frozen_string_literal: true
# common test helper file
require 'test_helper'

class ClostridiumBotulinumVirulentTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("ClostridiumBotulinumVirulent")[0]["strain"]
    # create object
    @organism = ClostridiumBotulinumVirulent.new(@strain)
  end

  def test_increase_pathogenicity_adds_to_symptoms_array
    @organism = ClostridiumBotulinumVirulent.new(@strain)
    refute_includes(@organism.symptoms, :paralysis, "symptoms should not include :paralysis")
    @organism.increase_pathogenicity
    assert_includes(@organism.symptoms, :paralysis, "symptoms should include :paralysis")
  end

  def test_increase_pathogenicity_increases_lethality
    @organism = ClostridiumBotulinumVirulent.new(@strain)
    lethality_before = @organism.lethality
    @organism.increase_pathogenicity
    assert_operator(@organism.lethality, :>, lethality_before, "increase_pathogenicity() should increase lethality")
  end
end
