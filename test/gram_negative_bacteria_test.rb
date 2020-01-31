# frozen_string_literal: true
# common test helper file
require 'test_helper'

class GramNegativeBacteriaTest < Minitest::Test
  def setup
    # set the strain
    @strain = "HY87"
    # create object
    @organism = GramNegativeBacteria.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(true, @organism.gram_negative, "gram_negative should be true")
    assert_includes(@organism.resistant_to, :Vancomycin, "resistant_to should include :Vancomycin")
    assert_includes(@organism.resistant_to, :Streptomycin, "resistant_to should include :Streptomycin")
    assert_nil(@organism.lps_type, "lps_type should be nil")
  end
end
