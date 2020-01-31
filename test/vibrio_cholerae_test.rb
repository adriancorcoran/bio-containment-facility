# frozen_string_literal: true
# common test helper file
require 'test_helper'

class VibrioCholeraeTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("VibrioCholerae")[0]["strain"]
    # create object
    @organism = VibrioCholerae.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:comma, @organism.shape, "shape should be :comma")
    assert_includes(@organism.resistant_to, :Gentamicin, "resistant_to should include :Gentamicin")
    assert_equal(:C, @organism.lps_type, "lps_type should be :C")
    assert_includes(@organism.symptoms, :diarrhoea, "symptoms should include :diarrhoea")
    assert_includes(@organism.symptoms, :vomiting, "symptoms should include :vomiting")
    assert_equal(15, @organism.cost_of_treatment, "cost_of_treatment should be 15")
    assert_equal(3, @organism.lethality, "lethality should be 3")
  end
end
