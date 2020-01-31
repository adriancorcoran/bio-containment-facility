# frozen_string_literal: true
# common test helper file
require 'test_helper'

class SmallpoxTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("Smallpox")[0]["strain"]
    # create object
    @organism = Smallpox.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:dna, @organism.rna_or_dna, "rna_or_dna should be :dna")
    assert_equal(false, @organism.single_stranded, "single_stranded should be false")
    assert_includes(@organism.symptoms, :high_fever, "symptoms should include :high_fever")
    assert_includes(@organism.symptoms, :flu_like_symptoms, "symptoms should include :flu_like_symptoms")
    assert_equal(45, @organism.cost_of_treatment, "cost_of_treatment should be 45")
    assert_equal(6, @organism.lethality, "lethality should be 6")
  end

  def test_increase_pathogenicity_adds_to_symptoms_array
    @organism = Smallpox.new(@strain)
    refute_includes(@organism.symptoms, :pus_filled_sores, "symptoms should not include :pus_filled_sores")
    @organism.increase_pathogenicity
    assert_includes(@organism.symptoms, :pus_filled_sores, "symptoms should include :pus_filled_sores")
  end
end
