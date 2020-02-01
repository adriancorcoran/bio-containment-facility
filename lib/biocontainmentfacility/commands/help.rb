# frozen_string_literal: true
require 'biocontainmentfacility'

module Biocontainmentfacility
  module Commands
    class Help < Biocontainmentfacility::Command
      def call(_args, _name)
        puts CLI::UI.fmt("{{bold:Available commands}}")
        puts ""

        Biocontainmentfacility::Commands::Registry.resolved_commands.each do |name, klass|
          next if name == 'help'
          puts CLI::UI.fmt("{{command:#{Biocontainmentfacility::TOOL_NAME} #{name}}}")
          help = klass.help
          if help
            puts CLI::UI.fmt(help)
          end
          puts ""
        end
      end
    end
  end
end
