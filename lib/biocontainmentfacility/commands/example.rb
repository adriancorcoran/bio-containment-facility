# frozen_string_literal: true
require 'biocontainmentfacility'

module Biocontainmentfacility
  module Commands
    class Example < Biocontainmentfacility::Command
      def call(_args, _name)
        puts 'neato'

        if rand < 0.05
          raise(CLI::Kit::Abort, "you got unlucky!")
        end
      end

      def self.help
        "A dummy command.\nUsage: {{command:#{Biocontainmentfacility::TOOL_NAME} example}}"
      end
    end
  end
end
