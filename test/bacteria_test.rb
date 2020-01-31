# frozen_string_literal: true
# common test helper file
require 'test_helper'

class BacteriaTest < Minitest::Test
  def setup
    # set the strain
    @strain = "GT67"
    # create object
    @organism = Bacteria.new(@strain)
  end

  def test_properties_are_correct
    assert_equal(1000, @organism.size, "size should be 1000")
    assert_equal(true, @organism.is_cell, "is_cell should be true")
    assert_nil(@organism.gram_negative, "gram_negative should be nil")
    assert_nil(@organism.shape, "shape should be nil")
  end
end
