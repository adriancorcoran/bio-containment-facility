# frozen_string_literal: true
# common test helper file
require 'test_helper'

class UITest < Minitest::Test
  # most functionality is outputting text
  # so we will simply test the arguments given to themethods taking arguments
  # test getting lethal organisms
  def test_display_summary
    ui = UI.new
    e = assert_raises ArgumentError do
      ui.display_summary("8")
    end
    assert_equal("Argument must be an integer", e.message)
  end

  def test_display_detail
    ui = UI.new
    e = assert_raises ArgumentError do
      ui.display_detail("10")
    end
    assert_equal("Argument must be an integer", e.message)
  end

  def test_display_lethal_organisms
    ui = UI.new
    e = assert_raises ArgumentError do
      ui.display_lethal_organisms(:symbol)
    end
    assert_equal("Argument must be an integer", e.message)
  end

  def test_display_cost_of_treatment
    ui = UI.new
    e = assert_raises ArgumentError do
      ui.display_cost_of_treatment("text")
    end
    assert_equal("Argument must be an integer", e.message)
  end

  def test_display_resistant_organisms
    ui = UI.new
    e = assert_raises ArgumentError do
      ui.display_resistant_organisms("letter")
    end
    assert_equal("Argument must be an integer", e.message)
  end

  def test_display_susceptible_organisms
    ui = UI.new
    e = assert_raises ArgumentError do
      ui.display_susceptible_organisms("test")
    end
    assert_equal("Argument must be an integer", e.message)
  end

  def test_diagnose_symptoms
    ui = UI.new
    e = assert_raises ArgumentError do
      ui.diagnose_symptoms("8")
    end
    assert_equal("Argument must be an array", e.message)
  end

  def test_get_organism_list_with_keys_outputs_string
    ui = UI.new
    str = ui.get_organism_list_with_keys
    assert_instance_of(String, str, "Output should be a string")
  end

  def test_get_treatment_list_with_keys_outputs_string
    ui = UI.new
    str = ui.get_treatment_list_with_keys
    assert_instance_of(String, str, "Output should be a string")
  end

  def test_get_symptom_list_with_keys_outputs_string
    ui = UI.new
    str = ui.get_symptom_list_with_keys
    assert_instance_of(String, str, "Output should be a string")
  end

  def test_get_num_organisms_outputs_integer
    ui = UI.new
    num = ui.get_num_organisms
    assert_instance_of(Integer, num, "Output should be an integer")
  end

  def test_get_num_treatmentss_outputsinteger
    ui = UI.new
    num = ui.get_num_treatments
    assert_instance_of(Integer, num, "Output should be an integer")
  end

  def test_get_num_symptomsoutputs_sinteger
    ui = UI.new
    num = ui.get_num_symptoms
    assert_instance_of(Integer, num, "Output should be an integer")
  end
end
