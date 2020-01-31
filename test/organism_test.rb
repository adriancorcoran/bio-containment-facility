# frozen_string_literal: true
# common test helper file
require 'test_helper'

class OrganismTest < Minitest::Test
  def setup
    # set the strain
    @strain = "U843"
    # create object
    @organism = Organism.new(@strain)
  end

  def test_strain_is_correct
    assert_equal(@organism.strain, @strain, "Strain is not correct")
  end

  def test_properties_are_correct
    assert_nil(@organism.size, "size should be nil")
    assert_nil(@organism.is_cell, "is_cell should be nil")
    assert_kind_of(Array, @organism.symptoms, "symptoms should be an array")
    assert_empty(@organism.symptoms, "symptoms array should be empty")
    assert_kind_of(Array, @organism.resistant_to, "resistant_to should be an array")
    assert_empty(@organism.resistant_to, "resistant_to array should be empty")
    assert_nil(@organism.cost_of_treatment, "cost_of_treatment should be nil")
    assert_nil(@organism.lethality, "lethality should be nil")
  end

  def test_to_string_method
    assert(@organism.to_s.instance_of?(String), "to_s is not outputting a string")
  end

  def test_resistant_to_contains_treatments
    @organism = Organism.new(@strain)
    @organism.resistant_to << :Penicillin << :Methicillin
    assert(@organism.resistant_to.count == 2, "incorrect number of items in resistant_to array")
  end

  def test_treat_argument
    @organism = Organism.new(@strain)
    # check error raised for incorrect type of argument
    e = assert_raises ArgumentError do
      @organism.treat?("treatment")
    end
    assert_equal("Argument must be a symbol", e.message)
  end

  def test_treat_against_no_resistance
    @organism = Organism.new(@strain)
    refute(@organism.resistant_to.include?(:Methicillin), "resistant_to array should not contain treatment")
    assert(@organism.treat?(:Methicillin), "treat should return true when resistant_to is empty")
  end

  def test_treat_against_other_resistance
    @organism = Organism.new(@strain)
    @organism.resistant_to << :Penicillin
    refute(@organism.resistant_to.include?(:Methicillin), "resistant_to array should not contain treatment")
    assert(@organism.treat?(:Methicillin), "treat should return true when resistant_to does not contain resistance")
  end

  def test_treat_against_this_resistance
    @organism = Organism.new(@strain)
    @organism.resistant_to << :Penicillin << :Methicillin
    assert(@organism.resistant_to.include?(:Methicillin), "resistant_to array should contain treatment")
    refute(@organism.treat?(:Methicillin), "treat should return false when resistant_to contains resistance")
  end

  def test_symptoms_contains_correct_number_of_symptoms
    @organism = Organism.new(@strain)
    @organism.symptoms << :vomiting << :sore_throat << :rash
    assert(@organism.symptoms.count == 3, "incorrect number of items in symptoms array")
  end

  def test_add_symptom_argument
    @organism = Organism.new(@strain)
    # check error raised for incorrect type of argument
    e = assert_raises ArgumentError do
      @organism.add_symptom("test symptom")
    end
    assert_equal("Argument must be a symbol", e.message)
  end

  def test_add_symptom
    @organism = Organism.new(@strain)
    @organism.symptoms = []
    @organism.add_symptom(:cough)
    assert_equal(1, @organism.symptoms.count, "add_symptom should add one symptom to the array")
    assert_includes(@organism.symptoms, :cough, "symptoms should include :cough")
  end

  def test_add_resistance_argument
    @organism = Organism.new(@strain)
    # check error raised for incorrect type of argument
    e = assert_raises ArgumentError do
      @organism.add_resistance("test resistance")
    end
    assert_equal("Argument must be a symbol", e.message)
  end

  def test_add_resistance
    @organism = Organism.new(@strain)
    @organism.resistant_to = []
    @organism.add_resistance(:Penicillin)
    @organism.add_resistance(:Methycillin)
    assert_equal(2, @organism.resistant_to.count, "add_resistance should add one treatment to the array")
    assert_includes(@organism.resistant_to, :Penicillin, "resistant_to should include :Penicillin")
    assert_includes(@organism.resistant_to, :Methycillin, "resistant_to should include :Methycillin")
  end

  def test_increase_lethality_argument
    @organism = Organism.new(@strain)
    # check error raised for incorrect type of argument
    e = assert_raises ArgumentError do
      @organism.increase_lethality("test")
    end
    assert_equal("Argument must be an integer", e.message)
  end

  def test_increase_lethality
    @organism = Organism.new(@strain)
    @organism.lethality = 1
    @organism.increase_lethality(3)
    assert_equal(4, @organism.lethality, "increase_lethality should increase lethality by the given amount")
    @organism.increase_lethality(1)
    assert_equal(5, @organism.lethality, "increase_lethality should increase lethality by the given amount")
  end

  def test_describe_symptoms_outputs_correctly
    @organism = Organism.new(@strain)
    @organism.symptoms << :vomiting << :sore_throat << :rash
    assert_equal("Symptoms include: vomiting, sore throat, rash.", @organism.describe_symptoms, "symptoms output is not correct")
  end

  def test_describe_resistance_outputs_correctly
    @organism = Organism.new(@strain)
    @organism.resistant_to << :Penicillin << :Methicillin
    assert_equal("This organism is resistant to: Penicillin, Methicillin.", @organism.describe_resistance, "resistance output is not correct")
  end
end
