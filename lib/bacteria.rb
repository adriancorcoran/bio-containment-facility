# frozen_string_literal: true
require_relative 'organism'

class Bacteria < Organism
  def initialize(strain)
    super(strain)
    @size = 1000
    @is_cell = true
    @gram_negative = nil
    @shape = nil
  end

  attr_accessor :size, :is_cell, :gram_negative, :shape

  def display_details
    str = super
    str += "  - Gram?: #{@gram_negative ? 'Negative' : 'Positive'}\n"
    str += "  - Shape: #{@shape} shape\n"
  end
end
