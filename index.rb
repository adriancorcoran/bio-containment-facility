# frozen_string_literal: true
require './lib/ui'
# create ui
ui = UI.new

# display a summary of all the organisms in the catalogue
# ui.display_summary_all

# display details of all the organisms in the catalogue
# ui.display_details_all

# display a summary of the chosen organism in the catalogue
# ui.display_summary(3)

# display details of the chosen organism in the catalogue
# ui.display_detail(3)

# display all bacteria in the catalogue
# ui.display_bacteria

# display all viruses in the catalogue
# ui.display_viruses

# display all organisms with greater than or equal to the chosen lethality
# ui.display_lethal_organisms(20)

# display the cost of treating all the organisms in the catalogue, for the given number of cases
# ui.display_cost_of_treatment(1000)

# find organisms resistant to the treatment given
# user will choose keys which represent treatments in the catalogue AVAILABLE_BACTERIAL_TREATMENTS
# ui.display_resistant_organisms(-1)

# find organisms susceptible to the treatment given
# user will choose keys which represent treatments in the catalogue AVAILABLE_BACTERIAL_TREATMENTS
# ui.display_susceptible_organisms(2)

# diagnose the cause from the symptoms given
# user will choose keys which represent symptoms in the catalogue array
ui.diagnose_symptoms([4, 5])
