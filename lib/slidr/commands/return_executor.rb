require 'slidr/commands/base_executor'

module Slidr
  module Commands
    class ReturnExecutor < BaseExecutor
      def initialize(content)
        @content = content
        @commands = []
      end

      def add(command)
        @commands << command
        self
      end

      def go
        @commands.each do |command|
          @content = command.go(@content)
        end
      end
    end
  end
end