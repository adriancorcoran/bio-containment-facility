# frozen_string_literal: true
# common test helper file
require 'test_helper'

class YersiniaPestisTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("YersiniaPestis")[0]["strain"]
    # create object
    @organism = YersiniaPestis.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:rod, @organism.shape, "shape should be :rod")
    assert_includes(@organism.resistant_to, :Penicillin, "resistant_to should include :Penicillin")
    assert_equal(:B, @organism.lps_type, "lps_type should be :B")
    assert_includes(@organism.symptoms, :high_fever, "symptoms should include :high_fever")
    assert_includes(@organism.symptoms, :chills, "symptoms should include :chills")
    assert_includes(@organism.symptoms, :headache, "symptoms should include :headache")
    assert_includes(@organism.symptoms, :bloody_cough, "symptoms should include :bloody_cough")
    assert_equal(40, @organism.cost_of_treatment, "cost_of_treatment should be 40")
    assert_equal(9, @organism.lethality, "lethality should be 9")
  end

  def test_increase_pathogenicity_adds_to_symptoms_array
    @organism = YersiniaPestis.new(@strain)
    refute_includes(@organism.symptoms, :plague_symptoms, "symptoms should not include :plague_symptoms")
    @organism.increase_pathogenicity
    assert_includes(@organism.symptoms, :plague_symptoms, "symptoms should include :plague_symptoms")
  end

  def test_increase_pathogenicity_increases_lethality
    @organism = YersiniaPestis.new(@strain)
    lethality_before = @organism.lethality
    @organism.increase_pathogenicity
    assert_operator(@organism.lethality, :>, lethality_before, "increase_pathogenicity() should increase lethality")
  end
end
