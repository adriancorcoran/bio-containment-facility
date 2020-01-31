# frozen_string_literal: true
require './lib/modules/formatting'

class Organism
  include Formatting

  def initialize(strain)
    @strain = strain.to_s
    @size = nil
    @is_cell = nil
    @symptoms = []
    @resistant_to = []
    @cost_of_treatment = nil
    @lethality = nil
  end

  attr_accessor :strain, :size, :is_cell, :symptoms, :resistant_to, :cost_of_treatment, :lethality

  def add_symptom(symptom)
    raise ArgumentError, "Argument must be a symbol" unless symptom.class == Symbol
    @symptoms << symptom
  end

  def add_resistance(treatment)
    raise ArgumentError, "Argument must be a symbol" unless treatment.class == Symbol
    @resistant_to << treatment
  end

  def increase_lethality(amount)
    raise ArgumentError, "Argument must be an integer" unless amount.class == Integer
    @lethality = @lethality.to_i + amount # to_i in case it is nil and we need to convert to 0 to add to it
  end

  def increase_pathogenicity
    # method should be overwritten if needed
  end

  def treat?(treatment)
    raise ArgumentError, "Argument must be a symbol" unless treatment.class == Symbol
    !@resistant_to.include?(treatment)
  end

  def to_s
    "#{self.class} - strain:#{@strain}"
  end

  def display_summary
    to_s + "\n"
  end

  def describe_symptoms
    "Symptoms include: #{symptoms.map { |symptom| symptom.to_s.gsub(/_/, ' ') }.join(', ')}."
  end

  def describe_resistance
    "This organism is resistant to: #{resistant_to.map { |resistance| resistance.to_s.gsub(/_/, ' ') }.join(', ')}."
  end

  def display_details
    str = "\n"
    str += heading(self.class.to_s)
    str += "  - Strain: #{@strain}\n"
    str += "  - Size: #{@size}nm\n"
    str += "  - Is a cell?: #{@is_cell ? 'Yes' : 'No'}\n"
    str += "  - Cost of treating one patient: $#{@cost_of_treatment}\n"
    str += "  - Lethality index: #{@lethality}\n"
  end
end
