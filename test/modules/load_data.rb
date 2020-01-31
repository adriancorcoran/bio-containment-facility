# frozen_string_literal: true
# require yaml to access seed data
require 'yaml'
# load the data for all tests
module LoadData
  DATA = YAML.load_file('./lib/data.yaml')
end
