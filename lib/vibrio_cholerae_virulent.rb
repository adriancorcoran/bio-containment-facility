# frozen_string_literal: true
require_relative 'vibrio_cholerae'

class VibrioCholeraeVirulent < VibrioCholerae
  def initialize(strain)
    super(strain)
  end

  def increase_pathogenicity
    add_symptom(:cholera)
    increase_lethality(6)
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    Vibrio cholerae strain:#{@strain} is one of the most prevalent and dangerous causes of cholera in the developing world.\n"
  end
end
