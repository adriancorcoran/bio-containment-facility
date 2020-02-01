# frozen_string_literal: true
$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))
require 'organism'
require 'bacteria'
require 'virus'
require 'gram_negative_bacteria'
require 'gram_positive_bacteria'
require 'escherichia_coli'
require 'escherichia_coli_virulent'
require 'vibrio_cholerae'
require 'vibrio_cholerae_virulent'
require 'yersinia_pestis'
require 'yersinia_pestis_resistance_plasmid'
require 'staphylococcus_aureus'
require 'staphylococcus_aureus_mrsa'
require 'streptococcus_pneumoniae'
require 'clostridium_botulinum'
require 'clostridium_botulinum_virulent'
require 'ebola'
require 'hiv'
require 'smallpox'

# modules
$LOAD_PATH.unshift(File.expand_path('../lib/modules', __dir__))
require 'resistance_plasmid'
# require 'formatting'

# gems
require 'yaml'

class BioCatalogue
  # get data from yaml file
  DATA = YAML.load_file('./lib/data.yaml')

  AVAILABLE_BACTERIAL_TREATMENTS = [:Amoxicillin, :Chloramphenicol, :Gentamicin]
  AVAILABLE_BACTERIAL_TREATMENTS << :Methycillin << :Penicillin << :Streptomycin
  AVAILABLE_BACTERIAL_TREATMENTS << :Tetracycline << :Vancomycin

  AVAILABLE_SYMPTOMS = [:abdominal_pain, :abscesses, :bloody_cough, :chills]
  AVAILABLE_SYMPTOMS << :cholera << :diarrhoea << :fever << :flu_like_symptoms << :food_poisoning
  AVAILABLE_SYMPTOMS << :headache << :high_fever << :joint_muscle_aches << :meningitis
  AVAILABLE_SYMPTOMS << :paralysis << :pneumonia << :respiratory_infections << :shiga_toxin_production
  AVAILABLE_SYMPTOMS << :sore_throat << :sores << :swelling_of_lymph_nodes << :vomiting << :weakness

  def initialize
    @organism_list = []
  end

  attr_accessor :organism_list

  def add_organisms(*args)
    args.each { |organism| @organism_list << organism }
  end

  def filter_for_bacteria
    @organism_list.select { |organism| organism.is_a?(Bacteria) }
  end

  def filter_for_viruses
    @organism_list.select { |organism| organism.is_a?(Virus) }
  end

  def trigger_pathogenicity_increase
    @organism_list.each(&:increase_pathogenicity)
  end

  def get_lethal_organisms(amount)
    raise ArgumentError, "Argument must be an integer" unless amount.class == Integer
    @organism_list.partition { |organism| organism.lethality >= amount }[0]
  end

  def get_cost_of_treatment(num_infections)
    raise ArgumentError, "Argument must be an integer" unless num_infections.class == Integer
    # @organism_list.inject(0) {|sum, organism| sum + organism.cost_of_treatment } * num_infections

    # the project called for the use of the map function, so I had to add it in somewhere :)
    @organism_list.map(&:cost_of_treatment).inject(&:+) * num_infections
  end

  def get_organisms_resistant_to(treatment)
    raise ArgumentError, "Argument must be a symbol" unless treatment.class == Symbol
    @organism_list.select { |organism| organism.resistant_to.include?(treatment) && organism.is_a?(Bacteria) }
  end

  def get_organisms_susceptible_to(treatment)
    raise ArgumentError, "Argument must be a symbol" unless treatment.class == Symbol
    @organism_list.select { |organism| !organism.resistant_to.include?(treatment) && organism.is_a?(Bacteria) }
  end

  def diagnose_symptoms(symptoms)
    raise ArgumentError, "Argument must be a non-empty array" unless symptoms.class == Array && !symptoms.empty?
    # loop through the list, for each organism, loop through the symptoms passed (args) in and
    # check all symptoms are contained in the organisms symptoms array
    @organism_list.select { |organism| symptoms.all? { |symptom| organism.symptoms.include?(symptom) } }
  end

  def self.create_catalogue
    catalogue = BioCatalogue.new
    # loop through data in yaml file, print each key and object
    DATA.each do |key, object_array|
      catalogue.add_organisms(Object.const_get(key).new(object_array[0]["strain"]))
    end
    catalogue
  end

  def display_summary(organism_list)
    raise ArgumentError, "Argument must be an array" unless organism_list.class == Array
    organism_list.map { |organism| "  - #{organism.display_summary}" }.join
  end

  def display_details(organism_list)
    raise ArgumentError, "Argument must be an array" unless organism_list.class == Array
    organism_list.map(&:display_details).join
  end
end
