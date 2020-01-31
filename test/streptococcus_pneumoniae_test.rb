# frozen_string_literal: true
# common test helper file
require 'test_helper'

class StreptococcusPneumoniaeTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("StreptococcusPneumoniae")[0]["strain"]
    # create object
    @organism = StreptococcusPneumoniae.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:round, @organism.shape, "shape should be :round")
    assert_includes(@organism.resistant_to, :Penicillin, "resistant_to should include :Penicillin")
    assert_equal(3, @organism.teichoic_acid_type, "teichoic_acid_type should be 3")
    assert_includes(@organism.symptoms, :pneumonia, "symptoms should include :pneumonia")
    assert_includes(@organism.symptoms, :meningitis, "symptoms should include :meningitis")
    assert_equal(10, @organism.cost_of_treatment, "cost_of_treatment should be 10")
    assert_equal(7, @organism.lethality, "lethality should be 7")
  end
end
