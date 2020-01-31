# frozen_string_literal: true
require './lib/bio_catalogue'
require './lib/modules/formatting'
require './lib/modules/text_snippets'

class UI
  # format lines and headings
  include Formatting
  # add in reusable text snippets
  include TextSnippets

  def display_summary_all
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # run method to increase pathogenicity and then run query again to see if anything has changed
    catalogue.trigger_pathogenicity_increase
    # headings
    puts heading("Displaying Summary for All Organisms")
    # run query
    puts catalogue.display_summary(catalogue.organism_list)
    # end
    puts "\n"
  end

  def display_details_all
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # run method to increase pathogenicity and then run query again to see if anything has changed
    catalogue.trigger_pathogenicity_increase
    # headings
    puts heading("Displaying Details for All Organisms")
    # run query
    puts catalogue.display_details(catalogue.organism_list)
    # end
    puts "\n"
  end

  def display_summary(key)
    raise ArgumentError, "Argument must be an integer" unless key.class == Integer
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # run method to increase pathogenicity and then run query again to see if anything has changed
    catalogue.trigger_pathogenicity_increase
    # headings
    puts heading("Displaying Summary for Chosen Organism")
    # run query
    puts catalogue.display_summary([catalogue.organism_list[key]])
    # end
    puts "\n"
  end

  def display_detail(key)
    raise ArgumentError, "Argument must be an integer" unless key.class == Integer
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # run method to increase pathogenicity and then run query again to see if anything has changed
    catalogue.trigger_pathogenicity_increase
    # headings
    puts heading("Displaying Details for Chosen Organism")
    # run query
    puts catalogue.display_details([catalogue.organism_list[key]])
    # end
    puts "\n"
  end

  def display_bacteria
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # headings
    puts heading("Displaying All Bacteria")
    # run query
    puts catalogue.display_summary(catalogue.get_bacteria)
    # end
    puts "\n"
  end

  def display_viruses
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # headings
    puts heading("Displaying All Viruses")
    # run query
    puts catalogue.display_summary(catalogue.get_viruses)
    # end
    puts "\n"
  end

  def display_lethal_organisms(lethality_index)
    raise ArgumentError, "Argument must be an integer" unless lethality_index.class == Integer
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # headings
    puts heading("Organisms with a Lethality Index >= #{lethality_index}")
    # run query
    results = catalogue.get_lethal_organisms(lethality_index)
    # display results
    puts results.count > 0 ? catalogue.display_summary(results) : no_results_found
    # run method to increase pathogenicity and then run query again to see if anything has changed
    catalogue.trigger_pathogenicity_increase
    puts pathogenicity_increase
    # run query
    results = catalogue.get_lethal_organisms(lethality_index)
    # display results
    puts results.count > 0 ? catalogue.display_summary(results) : no_results_found
    # end
    puts "\n"
  end

  def display_cost_of_treatment(number_of_cases)
    raise ArgumentError, "Argument must be an integer" unless number_of_cases.class == Integer
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # headings
    puts heading("Total Cost of Treatment for #{number_of_cases} #{plural('Case', number_of_cases)} of all organisms in the catalogue")
    # run query && display results
    puts currencyise(catalogue.get_cost_of_treatment(number_of_cases))
    # end
    puts "\n"
  end

  def display_resistant_organisms(treatment_key)
    raise ArgumentError, "Argument must be an integer" unless treatment_key.class == Integer
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # get choices from user
    treatment = BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS[treatment_key]
    # headings
    puts heading("Orgnaisms with Resistance to #{symbol_list_to_string([treatment])}")
    # run query
    results = catalogue.get_organisms_resistant_to(treatment)
    # display results
    puts results.count > 0 ? catalogue.display_summary(results) : no_results_found
    # run method to increase pathogenicity and then run query again to see if anything has changed
    catalogue.trigger_pathogenicity_increase
    puts pathogenicity_increase
    # run query
    results = catalogue.get_organisms_resistant_to(treatment)
    # display results
    puts results.count > 0 ? catalogue.display_summary(results) : no_results_found
    # end
    puts "\n"
  end

  def display_susceptible_organisms(treatment_key)
    raise ArgumentError, "Argument must be an integer" unless treatment_key.class == Integer
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # get choices from user
    treatment = BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS[treatment_key]
    # headings
    puts heading("Orgnaisms Susceptible to Treatment with #{symbol_list_to_string([treatment])}")
    # run query
    results = catalogue.get_organisms_susceptible_to(treatment)
    # display results
    puts results.count > 0 ? catalogue.display_summary(results) : no_results_found
    # run method to increase pathogenicity and then run query again to see if anything has changed
    catalogue.trigger_pathogenicity_increase
    puts pathogenicity_increase
    # run query
    results = catalogue.get_organisms_susceptible_to(treatment)
    # display results
    puts results.count > 0 ? catalogue.display_summary(results) : no_results_found
    # end
    puts "\n"
  end

  def diagnose_symptoms(symptoms_choice_array)
    raise ArgumentError, "Argument must be an array" unless symptoms_choice_array.class == Array
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # get choices from user
    symptoms = symptoms_choice_array.map { |key| BioCatalogue::AVAILABLE_SYMPTOMS[key] }
    # headings
    puts heading("Diagnosing Symptoms")
    puts "Symptoms are: #{symbol_list_to_string(symptoms)}\n\n"
    # text snippet
    puts possible_causes
    # run query
    results = catalogue.diagnose_symptoms(symptoms)
    # display results
    puts results.count > 0 ? catalogue.display_summary(results) : no_results_found
    # run method to increase pathogenicity and then run query again to see if anything has changed
    catalogue.trigger_pathogenicity_increase
    puts pathogenicity_increase
    # text snippet
    puts possible_causes
    # run query
    results = catalogue.diagnose_symptoms(symptoms)
    # display results
    puts results.count > 0 ? catalogue.display_summary(results) : no_results_found
    # end
    puts "\n"
  end

  def get_organism_list_with_keys
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # iterate and create string
    catalogue.organism_list.each_with_index.map { |organism, index| "  #{index + 1}. #{organism}" }.join("\n")
  end

  def get_treatment_list_with_keys
    # iterate and create string
    BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS.each_with_index.map { |treatment, index| "  #{index + 1}. #{symbol_list_to_string([treatment])}" }.join("\n")
  end

  def get_symptom_list_with_keys
    # iterate and create string
    BioCatalogue::AVAILABLE_SYMPTOMS.each_with_index.map { |symptom, index| "  #{index + 1}. #{symbol_list_to_string([symptom])}" }.join("\n")
  end

  def get_num_organisms
    # create catalogue
    catalogue = BioCatalogue.create_catalogue
    # count
    catalogue.organism_list.count
  end

  def get_num_treatments
    # count
    BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS.count
  end

  def get_num_symptoms
    # count
    BioCatalogue::AVAILABLE_SYMPTOMS.count
  end
end
