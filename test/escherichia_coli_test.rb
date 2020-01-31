# frozen_string_literal: true
# common test helper file
require 'test_helper'

class EscherichiaColiTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("EscherichiaColi")[0]["strain"]
    # create object
    @organism = EscherichiaColi.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:rod, @organism.shape, "shape should be :rod")
    assert_includes(@organism.resistant_to, :Tetracycline, "resistant_to should include :Tetracycline")
    assert_equal(:A, @organism.lps_type, "lps_type should be :A")
    assert_includes(@organism.symptoms, :diarrhoea, "symptoms should include :diarrhoea")
    assert_includes(@organism.symptoms, :abdominal_pain, "symptoms should include :abdominal_pain")
    assert_includes(@organism.symptoms, :fever, "symptoms should include :fever")
    assert_includes(@organism.symptoms, :vomiting, "symptoms should include :vomiting")
    assert_equal(20, @organism.cost_of_treatment, "cost_of_treatment should be 20")
    assert_equal(1, @organism.lethality, "lethality should be 1")
  end
end
