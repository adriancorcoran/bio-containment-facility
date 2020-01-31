# frozen_string_literal: true
# common test helper file
require 'test_helper'

class ResistancePlasmidTest < Minitest::Test
  class TestOrganism
    include ResistancePlasmid

    def initialize
      @resistant_to = []
    end

    attr_accessor :resistant_to
  end

  def test_plasmid_confers_resistance_to_methicillin
    @organism = TestOrganism.new
    refute_includes(@organism.resistant_to, :Methicillin, "resistant_to should not include :Methicillin")
    @organism.increase_pathogenicity_from_plasmid
    assert_includes(@organism.resistant_to, :Methicillin, "resistant_to should include :Methicillin")
  end

  def test_plasmid_confers_resistance_to_gentamicin
    @organism = TestOrganism.new
    refute_includes(@organism.resistant_to, :Gentamicin, "resistant_to should not include :Gentamicin")
    @organism.increase_pathogenicity_from_plasmid
    assert_includes(@organism.resistant_to, :Gentamicin, "resistant_to should include :Gentamicin")
  end

  def test_plasmid_confers_resistance_to_tetracycline
    @organism = TestOrganism.new
    refute_includes(@organism.resistant_to, :Tetracycline, "resistant_to should not include :Tetracycline")
    @organism.increase_pathogenicity_from_plasmid
    assert_includes(@organism.resistant_to, :Tetracycline, "resistant_to should include :Tetracycline")
  end
end
