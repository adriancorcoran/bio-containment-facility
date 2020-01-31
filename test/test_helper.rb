# frozen_string_literal: true
require 'simplecov'
SimpleCov.start

# require yaml to access seed data
require 'yaml'
require 'minitest/autorun'
# test modules
# (adds the path from this directory to the target to the LOAD PATH array)
$LOAD_PATH.unshift(File.expand_path('modules', __dir__))
require 'load_data'
# classes
$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))
require 'ui'
require 'bio_catalogue'

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
