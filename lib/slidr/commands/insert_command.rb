require 'slidr/commands/base_command'

module Slidr
  module Commands
    class InsertCommand < BaseCommand
      def initialize(pattern, value)
        @pattern = pattern
        @value = value
      end

      def go(content)
        content.sub(@pattern, @value)
      end
    end
  end
end