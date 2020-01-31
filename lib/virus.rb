# frozen_string_literal: true
require_relative 'organism'

class Virus < Organism
  def initialize(strain)
    super(strain)
    @size = 300
    @is_cell = false
    @rna_or_dna = nil
    @single_stranded = nil
  end

  attr_accessor :size, :is_cell, :rna_or_dna, :single_stranded

  def display_details
    str = super
    str += "  - Nucleic acid type: #{@rna_or_dna.to_s.upcase}\n"
    str += "  - Strand Type: #{@single_stranded ? 'Single' : 'Double'} stranded\n"
    str += line_short
    str += "  - #{describe_symptoms}\n"
    str += line_short + "  - #{describe_resistance}\n" unless @resistant_to.empty?
    str
  end
end
