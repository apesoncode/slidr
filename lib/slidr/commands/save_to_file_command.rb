require 'slidr/commands/base_command'

module Slidr
  module Commands
    class SaveToFileCommand < BaseCommand
      def initialize(path)
        @path = path
      end

      def go(content)
        File.open(@path, "w") do |file| 
          file.puts content
        end
        content
      end

    end
  end
end