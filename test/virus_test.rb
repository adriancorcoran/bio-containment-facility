# frozen_string_literal: true
# common test helper file
require 'test_helper'

class VirusTest < Minitest::Test
  def setup
    # set the strain
    @strain = "VR45"
    # create object
    @organism = Virus.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(300, @organism.size, "size should be 300")
    assert_equal(false, @organism.is_cell, "is_cell should be false")
    assert_nil(@organism.rna_or_dna, "rna_or_dna should be nil")
    assert_nil(@organism.single_stranded, "single_stranded should be nil")
  end
end
