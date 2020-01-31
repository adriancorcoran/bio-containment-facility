# frozen_string_literal: true
# common test helper file
require 'test_helper'

class BioCatalogueTest < Minitest::Test
  def setup
    @catalogue = BioCatalogue.new
  end

  # test available treatments is array
  def test_yaml_data_is_hash
    assert_kind_of(Hash, BioCatalogue::DATA, "DATA should be an array")
  end

  # test available treatments not empty
  def test_yaml_data_not_empty
    refute_empty(BioCatalogue::DATA, "DATA array should not be empty")
  end

  # test available treatments is array
  def test_available_bacterial_treatments_is_array
    assert_kind_of(Array, BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS, "AVAILABLE_BACTERIAL_TREATMENTS should be an array")
  end

  # test available treatments not empty
  def test_available_bacterial_treatments_not_empty
    refute_empty(BioCatalogue::AVAILABLE_BACTERIAL_TREATMENTS, "AVAILABLE_BACTERIAL_TREATMENTS array should not be empty")
  end

  # test available treatments is array
  def test_available_symptoms_is_array
    assert_kind_of(Array, BioCatalogue::AVAILABLE_SYMPTOMS, "AVAILABLE_SYMPTOMS should be an array")
  end

  # test available treatments not empty
  def test_available_symptoms_not_empty
    refute_empty(BioCatalogue::AVAILABLE_SYMPTOMS, "AVAILABLE_SYMPTOMS array should not be empty")
  end

  # test organism list is array
  def test_organism_list_is_array
    assert_kind_of(Array, @catalogue.organism_list, "organism_list should be an array")
  end

  # test adding organism to organism list
  def test_adding_organism_to_organism_list
    @catalogue = BioCatalogue.new
    ebola = Ebola.new("ST45")
    refute_includes(@catalogue.organism_list, ebola, "organism should not be in organism list")
    @catalogue.add_organisms(ebola)
    assert_includes(@catalogue.organism_list, ebola, "organism should be in organism list")
  end

  # test adding multiple organism to organism list
  def test_adding_organisms_to_organism_list
    @catalogue = BioCatalogue.new
    hiv = HIV.new("ST45")
    ebola = Ebola.new("ST45")
    smallpox = Smallpox.new("ST45")
    refute_includes(@catalogue.organism_list, hiv, "organism should not be in organism list")
    refute_includes(@catalogue.organism_list, ebola, "organism should not be in organism list")
    refute_includes(@catalogue.organism_list, smallpox, "organism should not be in organism list")
    @catalogue.add_organisms(hiv, ebola, smallpox)
    assert_includes(@catalogue.organism_list, hiv, "organism should be in organism list")
    assert_includes(@catalogue.organism_list, ebola, "organism should be in organism list")
    assert_includes(@catalogue.organism_list, smallpox, "organism should be in organism list")
  end

  # test get bacteria
  def test_get_bacteria
    @catalogue = BioCatalogue.new
    hiv = HIV.new("ST45")
    e_coli = EscherichiaColi.new("ST45")
    s_aureus = StaphylococcusAureus.new("ST45")
    @catalogue.add_organisms(hiv, e_coli, s_aureus)
    assert_equal(3, @catalogue.organism_list.count, "There should be 3 items in the organism list")
    bacteria_list = @catalogue.get_bacteria
    assert_equal(2, bacteria_list.count, "There should be 2 items in the bacteria_list")
    refute_includes(bacteria_list, hiv, "organism should not be in bacteria_list")
    assert_includes(bacteria_list, e_coli, "organism should be in bacteria_list")
    assert_includes(bacteria_list, s_aureus, "organism should be in bacteria_list")
  end

  # test get viruses
  def test_get_viruses
    @catalogue = BioCatalogue.new
    ebola = Ebola.new("ST45")
    smallpox = Smallpox.new("ST45")
    e_coli = EscherichiaColi.new("ST45")
    s_pneumoniae = StreptococcusPneumoniae.new("ST45")
    @catalogue.add_organisms(ebola, smallpox, e_coli, s_pneumoniae)
    assert_equal(4, @catalogue.organism_list.count, "There should be 4 items in the organism list")
    virus_list = @catalogue.get_viruses
    assert_equal(2, virus_list.count, "There should be 2 items in the organism list")
    assert_includes(virus_list, ebola, "organism should be in virus_list")
    assert_includes(virus_list, smallpox, "organism should be in virus_list")
    refute_includes(virus_list, e_coli, "organism should not be in virus_list")
    refute_includes(virus_list, s_pneumoniae, "organism should not be in virus_list")
  end

  # test triggering pathogenicity on organisms
  # the test below is very specific on the amounts (3, :cholera), I would normally make this more general,
  # however it's fine for what's needed right now
  def test_triggering_pathogenicity_on_organisms
    @catalogue = BioCatalogue.new
    v_cholerae = VibrioCholeraeVirulent.new("ST45")
    @catalogue.add_organisms(v_cholerae)
    lethality_before = @catalogue.organism_list[0].lethality
    symptoms_before = @catalogue.organism_list[0].symptoms
    refute_includes(symptoms_before, :cholera, "symptoms should not include :cholera")
    @catalogue.trigger_pathogenicity_increase
    assert_operator(@catalogue.organism_list[0].lethality, :>, lethality_before, "Lethality should have increased")
    assert_includes(@catalogue.organism_list[0].symptoms, :cholera, "symptoms should include :cholera")
  end

  # test triggering pathogenicity on plasimd organism
  def test_triggering_pathogenicity_on_plasmid_organisms
    @catalogue = BioCatalogue.new
    y_pestis = YersiniaPestisResistancePlasmid.new("ST45")
    @catalogue.add_organisms(y_pestis)
    lethality_before = @catalogue.organism_list[0].lethality
    resistant_to_before = @catalogue.organism_list[0].resistant_to
    refute_includes(resistant_to_before, :Methicillin, "resistant_to should not include :Methicillin")
    @catalogue.trigger_pathogenicity_increase
    assert_operator(@catalogue.organism_list[0].lethality, :>, lethality_before, "Lethality should have increased")
    assert_includes(@catalogue.organism_list[0].resistant_to, :Methicillin, "resistant_to should include :Methicillin")
  end

  # test getting lethal organisms
  def test_getting_lethal_organisms_argument
    @catalogue = BioCatalogue.new
    e = assert_raises ArgumentError do
      @catalogue.get_lethal_organisms("letter")
    end
    assert_equal("Argument must be an integer", e.message)
  end

  # test getting lethal organisms
  def test_getting_lethal_organisms
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(Ebola.new("ST45"), HIV.new("ST45"), Smallpox.new("ST45"), EscherichiaColi.new("ST45"), EscherichiaColiVirulent.new("ST45"), StaphylococcusAureus.new("ST45"), StaphylococcusAureusMRSA.new("ST45"), StreptococcusPneumoniae.new("ST45"), VibrioCholeraeVirulent.new("ST45"), YersiniaPestisResistancePlasmid.new("ST45"), ClostridiumBotulinumVirulent.new("ST45"), ClostridiumBotulinum.new("ST45"))
    lethal_list_1 = @catalogue.get_lethal_organisms(5)
    lethal_list_2 = @catalogue.get_lethal_organisms(9)
    assert_equal(6, lethal_list_1.count, "lethal_list_1 should have 7 organisms")
    assert_equal(3, lethal_list_2.count, "lethal_list_2 should have 3 organisms")
  end

  # test getting lethal organisms after pathogenicity increase
  def test_getting_lethal_organisms_after_pathogenicity_increase
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(Ebola.new("ST45"), HIV.new("ST45"), Smallpox.new("ST45"), EscherichiaColi.new("ST45"), EscherichiaColiVirulent.new("ST45"), StaphylococcusAureus.new("ST45"), StaphylococcusAureusMRSA.new("ST45"), StreptococcusPneumoniae.new("ST45"), VibrioCholeraeVirulent.new("ST45"), YersiniaPestisResistancePlasmid.new("ST45"), ClostridiumBotulinumVirulent.new("ST45"), ClostridiumBotulinum.new("ST45"))
    @catalogue.trigger_pathogenicity_increase
    lethal_list_1 = @catalogue.get_lethal_organisms(5)
    lethal_list_2 = @catalogue.get_lethal_organisms(9)
    assert_equal(8, lethal_list_1.count, "lethal_list_1 should have 8 organisms")
    assert_equal(5, lethal_list_2.count, "lethal_list_2 should have 4 organisms")
  end

  # test getting lethal organisms
  def test_totalling_the_cost_of_treatment_argument
    @catalogue = BioCatalogue.new
    e = assert_raises ArgumentError do
      @catalogue.get_cost_of_treatment(:symbol)
    end
    assert_equal("Argument must be an integer", e.message)
  end

  # test totalling the cost of treatment
  def test_totalling_the_cost_of_treatment
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(HIV.new("ST45"), EscherichiaColi.new("ST45"), StaphylococcusAureus.new("ST45"), ClostridiumBotulinumVirulent.new("ST45"))
    assert_equal(100000, @catalogue.get_cost_of_treatment(1000), "get_cost_of_treatment should be 100000")
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(HIV.new("ST45"), EscherichiaColi.new("ST45"))
    assert_equal(70000, @catalogue.get_cost_of_treatment(1000), "get_cost_of_treatment should be 70000")
  end

  # test getting lethal organisms
  def test_getting_list_of_organisms_resistant_to_specific_treatment_argument
    @catalogue = BioCatalogue.new
    e = assert_raises ArgumentError do
      @catalogue.get_organisms_resistant_to(8)
    end
    assert_equal("Argument must be a symbol", e.message)
  end

  # test getting a list of organisms resistant to specific treatment
  def test_getting_list_of_organisms_resistant_to_specific_treatment
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(EscherichiaColi.new("ST45"), StaphylococcusAureus.new("ST45"), StaphylococcusAureusMRSA.new("ST45"), VibrioCholerae.new("ST45"), YersiniaPestisResistancePlasmid.new("ST45"))
    resistant_list_1 = @catalogue.get_organisms_resistant_to(:Vancomycin)
    resistant_list_2 = @catalogue.get_organisms_resistant_to(:Tetracycline)
    resistant_list_3 = @catalogue.get_organisms_resistant_to(:Gentamicin)
    assert_equal(3, resistant_list_1.count, "resistant_list_1 should have 3 organisms")
    assert_equal(3, resistant_list_2.count, "resistant_list_2 should have 3 organisms")
    assert_equal(1, resistant_list_3.count, "resistant_list_3 should have 1 organisms")
  end

  # test getting a list of organisms resistant to specific treatment after pathogenicity increase
  def test_getting_list_of_organisms_resistant_to_specific_treatment_after_pathogenicity_increase
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(EscherichiaColi.new("ST45"), StaphylococcusAureus.new("ST45"), StaphylococcusAureusMRSA.new("ST45"), VibrioCholerae.new("ST45"), YersiniaPestisResistancePlasmid.new("ST45"))
    @catalogue.trigger_pathogenicity_increase
    resistant_list_1 = @catalogue.get_organisms_resistant_to(:Vancomycin)
    resistant_list_2 = @catalogue.get_organisms_resistant_to(:Tetracycline)
    resistant_list_3 = @catalogue.get_organisms_resistant_to(:Gentamicin)
    assert_equal(4, resistant_list_1.count, "resistant_list_1 should have 4 organisms")
    assert_equal(4, resistant_list_2.count, "resistant_list_2 should have 4 organisms")
    assert_equal(3, resistant_list_3.count, "resistant_list_3 should have 3 organisms")
  end

  # test getting lethal organisms
  def test_getting_list_of_organisms_susceptible_to_specific_treatment_argument
    @catalogue = BioCatalogue.new
    e = assert_raises ArgumentError do
      @catalogue.get_organisms_susceptible_to("8")
    end
    assert_equal("Argument must be a symbol", e.message)
  end

  # test getting a list of organisms susceptible to specific treatment
  def test_getting_list_of_organisms_susceptible_to_specific_treatment
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(EscherichiaColi.new("ST45"), StaphylococcusAureus.new("ST45"), StaphylococcusAureusMRSA.new("ST45"), VibrioCholerae.new("ST45"), YersiniaPestisResistancePlasmid.new("ST45"))
    susceptible_list_1 = @catalogue.get_organisms_susceptible_to(:Vancomycin)
    susceptible_list_2 = @catalogue.get_organisms_susceptible_to(:Tetracycline)
    susceptible_list_3 = @catalogue.get_organisms_susceptible_to(:Gentamicin)
    assert_equal(2, susceptible_list_1.count, "susceptible_list_1 should have 2 organisms")
    assert_equal(2, susceptible_list_2.count, "susceptible_list_2 should have 2 organisms")
    assert_equal(4, susceptible_list_3.count, "susceptible_list_3 should have 4 organisms")
  end

  # test getting a list of organisms susceptible to specific treatment after pathogenicity increase
  def test_getting_list_of_organisms_susceptible_to_specific_treatment_after_pathogenicity_increase
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(EscherichiaColi.new("ST45"), StaphylococcusAureus.new("ST45"), StaphylococcusAureusMRSA.new("ST45"), VibrioCholerae.new("ST45"), YersiniaPestisResistancePlasmid.new("ST45"))
    @catalogue.trigger_pathogenicity_increase
    susceptible_list_1 = @catalogue.get_organisms_susceptible_to(:Vancomycin)
    susceptible_list_2 = @catalogue.get_organisms_susceptible_to(:Tetracycline)
    susceptible_list_3 = @catalogue.get_organisms_susceptible_to(:Gentamicin)
    assert_equal(1, susceptible_list_1.count, "susceptible_list_1 should have 1 organisms")
    assert_equal(1, susceptible_list_2.count, "susceptible_list_2 should have 1 organisms")
    assert_equal(2, susceptible_list_3.count, "susceptible_list_3 should have 2 organisms")
  end

  # test getting lethal organisms
  def test_diagnosing_using_list_of_symptoms_argument
    @catalogue = BioCatalogue.new
    e = assert_raises ArgumentError do
      @catalogue.diagnose_symptoms(100)
    end
    assert_equal("Argument must be a non-empty array", e.message)
  end

  # test diagnosing using list of symptoms
  def test_diagnosing_using_list_of_symptoms
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(EscherichiaColi.new("ST45"), EscherichiaColiVirulent.new("ST45"), StaphylococcusAureus.new("ST45"), StaphylococcusAureusMRSA.new("ST45"), VibrioCholerae.new("ST45"))
    symptom_list_1 = @catalogue.diagnose_symptoms([:diarrhoea])
    symptom_list_2 = @catalogue.diagnose_symptoms([:shiga_toxin_production])
    symptom_list_3 = @catalogue.diagnose_symptoms([:diarrhoea, :vomiting, :fever])
    symptom_list_4 = @catalogue.diagnose_symptoms([:respiratory_infections, :abscesses])
    assert_equal(3, symptom_list_1.count, "symptom_list_1 should have 3 organisms")
    assert_equal(0, symptom_list_2.count, "symptom_list_2 should have 0 organisms")
    assert_equal(2, symptom_list_3.count, "symptom_list_3 should have 2 organisms")
    assert_equal(0, symptom_list_4.count, "symptom_list_4 should have 0 organisms")
  end

  # test diagnosing using list of symptoms after pathogenicity increase
  def test_diagnosing_using_list_of_symptoms_after_pathogenicity_increase
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(EscherichiaColi.new("ST45"), EscherichiaColiVirulent.new("ST45"), StaphylococcusAureus.new("ST45"), StaphylococcusAureusMRSA.new("ST45"), VibrioCholerae.new("ST45"))
    @catalogue.trigger_pathogenicity_increase
    symptom_list_1 = @catalogue.diagnose_symptoms([:diarrhoea])
    symptom_list_2 = @catalogue.diagnose_symptoms([:shiga_toxin_production])
    symptom_list_3 = @catalogue.diagnose_symptoms([:diarrhoea, :vomiting, :fever])
    symptom_list_4 = @catalogue.diagnose_symptoms([:respiratory_infections, :abscesses])
    assert_equal(3, symptom_list_1.count, "symptom_list_1 should have 3 organisms")
    assert_equal(1, symptom_list_2.count, "symptom_list_2 should have 1 organisms")
    assert_equal(2, symptom_list_3.count, "symptom_list_3 should have 2 organisms")
    assert_equal(2, symptom_list_4.count, "symptom_list_4 should have 2 organisms")
  end

  def test_create_catalogue_returns_catalogue
    catalogue = BioCatalogue.create_catalogue
    assert(catalogue.instance_of?(BioCatalogue))
  end

  def test_display_summary_argument
    @catalogue = BioCatalogue.new
    e = assert_raises ArgumentError do
      @catalogue.display_summary(:symbol)
    end
    assert_equal("Argument must be an array", e.message)
  end

  def test_display_summary_return_string
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(Ebola.new("OU89"))
    str = @catalogue.display_summary(@catalogue.organism_list)
    assert_kind_of(String, str, "Display summary should return a string")
  end

  def test_display_details_argument
    @catalogue = BioCatalogue.new
    e = assert_raises ArgumentError do
      @catalogue.display_details(:symbol)
    end
    assert_equal("Argument must be an array", e.message)
  end

  def test_display_details_return_string
    @catalogue = BioCatalogue.new
    @catalogue.add_organisms(Ebola.new("OU89"))
    str = @catalogue.display_details(@catalogue.organism_list)
    assert_kind_of(String, str, "Display summary should return a string")
  end
end
