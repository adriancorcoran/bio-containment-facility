# frozen_string_literal: true
# common test helper file
require 'test_helper'

class ClostridiumBotulinumTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("ClostridiumBotulinum")[0]["strain"]
    # create object
    @organism = ClostridiumBotulinum.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:round, @organism.shape, "shape should be :round")
    assert_includes(@organism.resistant_to, :Amoxicillin, "resistant_to should include :Amoxicillin")
    assert_equal(7, @organism.teichoic_acid_type, "teichoic_acid_type should be 7")
    assert_includes(@organism.symptoms, :fever, "symptoms should include :fever")
    assert_equal(25, @organism.cost_of_treatment, "cost_of_treatment should be 25")
    assert_equal(0, @organism.lethality, "lethality should be 0")
  end
end
