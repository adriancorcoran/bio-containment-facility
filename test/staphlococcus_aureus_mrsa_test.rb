# frozen_string_literal: true
# common test helper file
require 'test_helper'

class StaphylococcusAureusMRSATest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("StaphylococcusAureusMRSA")[0]["strain"]
    # create object
    @organism = StaphylococcusAureusMRSA.new(@strain)
  end

  def test_properties_are_correct
    assert_includes(@organism.resistant_to, :Methycillin, "resistant_to should include :Methycillin")
    assert_includes(@organism.symptoms, :sores, "symptoms should include :sores")
    assert_equal(45, @organism.cost_of_treatment, "cost_of_treatment should be 45")
    assert_equal(9, @organism.lethality, "lethality should be 9")
  end

  def test_increase_pathogenicity_adds_all_anitbiotics_in_resistant_to_array
    @organism = StaphylococcusAureusMRSA.new(@strain)
    @organism.resistant_to = []
    BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS.each do |treatment|
      refute_includes @organism.resistant_to, treatment, "resistant_to should not include #{treatment}"
    end
    @organism.increase_pathogenicity
    BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS.each do |treatment|
      assert_includes @organism.resistant_to, treatment, "resistant_to should include #{treatment}"
    end
  end
end
