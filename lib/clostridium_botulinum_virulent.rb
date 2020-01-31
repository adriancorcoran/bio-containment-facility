# frozen_string_literal: true
require_relative 'clostridium_botulinum'

class ClostridiumBotulinumVirulent < ClostridiumBotulinum
  def initialize(strain)
    super(strain)
  end

  def increase_pathogenicity
    add_symptom(:paralysis)
    increase_lethality(5)
  end

  def display_details
    str = super
    str += line_short
    str += "    Virulence:\n"
    str += "    The toxin of Clostridium botulinim causes botulism, a paralaysis of the nerve fibres leading to death through asphixiation.\n"
  end
end
