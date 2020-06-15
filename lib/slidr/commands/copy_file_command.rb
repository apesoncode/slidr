require 'fileutils'
require 'slidr/commands/base_command'

module Slidr
  module Commands
    class CopyFileCommand < BaseCommand
      def initialize(from, to)
        @from = from
        @to = to
      end

      def go
        FileUtils.cp(@from, @to)
      end
    end
  end
end