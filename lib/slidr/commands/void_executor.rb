require 'slidr/commands/base_executor'
module Slidr
  module Commands
    class VoidExecutor < BaseExecutor
      def initialize
        @commands = []
      end

      def add(command)
        @commands << command
        self
      end

      def go
        @commands.each do |command|
          command.go
        end
      end
    end
  end
end