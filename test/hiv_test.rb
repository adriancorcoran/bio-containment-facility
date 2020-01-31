# frozen_string_literal: true
# common test helper file
require 'test_helper'

class HIVTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("HIV")[0]["strain"]
    # create object
    @organism = HIV.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:rna, @organism.rna_or_dna, "rna_or_dna should be :rna")
    assert_equal(true, @organism.single_stranded, "single_stranded should be true")
    assert_includes(@organism.symptoms, :swelling_of_lymph_nodes, "symptoms should include :swelling_of_lymph_nodes")
    assert_includes(@organism.symptoms, :weakness, "symptoms should include :weakness")
    assert_equal(50, @organism.cost_of_treatment, "cost_of_treatment should be 50")
    assert_equal(8, @organism.lethality, "lethality should be 8")
  end

  def test_increase_pathogenicity_adds_to_symptoms_array
    @organism = HIV.new(@strain)
    refute_includes(@organism.symptoms, :compromised_immune_system, "symptoms should not include :compromised_immune_system")
    @organism.increase_pathogenicity
    assert_includes(@organism.symptoms, :compromised_immune_system, "symptoms should include :compromised_immune_system")
  end

  def test_increase_pathogenicity_increases_lethality
    @organism = HIV.new(@strain)
    lethality_before = @organism.lethality
    @organism.increase_pathogenicity
    assert_operator(@organism.lethality, :>, lethality_before, "increase_pathogenicity() should increase lethality")
  end
end
