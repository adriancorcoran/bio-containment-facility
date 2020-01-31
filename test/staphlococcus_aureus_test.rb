# frozen_string_literal: true
# common test helper file
require 'test_helper'

class StaphylococcusAureusTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("StaphylococcusAureus")[0]["strain"]
    # create object
    @organism = StaphylococcusAureus.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:round, @organism.shape, "shape should be :round")
    assert_includes(@organism.resistant_to, :Penicillin, "resistant_to should include :Penicillin")
    assert_equal(6, @organism.teichoic_acid_type, "teichoic_acid_type should be 6")
    assert_includes(@organism.symptoms, :respiratory_infections, "symptoms should include :respiratory_infections")
    assert_includes(@organism.symptoms, :food_poisoning, "symptoms should include :food_poisoning")
    assert_equal(5, @organism.cost_of_treatment, "cost_of_treatment should be 5")
    assert_equal(1, @organism.lethality, "lethality should be 1")
  end

  def test_increase_pathogenicity_adds_to_symptoms_array
    @organism = StaphylococcusAureus.new(@strain)
    refute_includes(@organism.symptoms, :abscesses, "symptoms should not include :abscesses")
    @organism.increase_pathogenicity
    assert_includes(@organism.symptoms, :abscesses, "symptoms should include :abscesses")
  end
end
