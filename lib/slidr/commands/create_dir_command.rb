require 'fileutils'
require 'slidr/commands/base_command'

module Slidr
  module Commands
    class CreateDirCommand < BaseCommand
      def initialize(path)
        @path = path
      end

      def go
        unless File.directory?(@path)
          FileUtils.mkdir_p(@path)
        end
      end
    end
  end
end