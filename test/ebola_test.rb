# frozen_string_literal: true
# common test helper file
require 'test_helper'

class EbolaTest < Minitest::Test
  # load the data from the module
  include LoadData

  def setup
    # get the first strain for this organism
    @strain = DATA.fetch("Ebola")[0]["strain"]
    # create object
    @organism = Ebola.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(:rna, @organism.rna_or_dna, "rna_or_dna should be :rna")
    assert_equal(true, @organism.single_stranded, "single_stranded should be true")
    assert_includes(@organism.symptoms, :fever, "symptoms should include :fever")
    assert_includes(@organism.symptoms, :headache, "symptoms should include :headache")
    assert_includes(@organism.symptoms, :joint_muscle_aches, "symptoms should include :joint_muscle_aches")
    assert_includes(@organism.symptoms, :sore_throat, "symptoms should include :sore_throat")
    assert_equal(25, @organism.cost_of_treatment, "cost_of_treatment should be 25")
    assert_equal(9, @organism.lethality, "lethality should be 9")
  end
end
