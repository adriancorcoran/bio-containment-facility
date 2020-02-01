# frozen_string_literal: true
# contain resistance functions
module TextSnippets
  def possible_causes
    "  Possible causes are:\n\n"
  end

  def pathogenicity_increase
    str = "\n  => After pathogenicity increase triggered (usually by environmental factor, random mutation or "
    str += "plasmid acquisition)...\n\n"
    str
  end

  def no_results_found
    "  No results found!\n"
  end
end
