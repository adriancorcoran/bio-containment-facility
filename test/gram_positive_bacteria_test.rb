# frozen_string_literal: true
# common test helper file
require 'test_helper'

class GramPositiveBacteriaTest < Minitest::Test
  def setup
    # set the strain
    @strain = "BT32"
    # create object
    @organism = GramPositiveBacteria.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(false, @organism.gram_negative, "gram_negative should be false")
    assert_includes(@organism.resistant_to, :Chloramphenicol, "resistant_to should include :Chloramphenicol")
    assert_includes(@organism.resistant_to, :Tetracycline, "resistant_to should include :Tetracycline")
    assert_nil(@organism.teichoic_acid_type, "teichoic_acid_type should be nil")
  end
end
