require 'fileutils'
require 'slidr/commands/base_command'

module Slidr
  module Commands
    class CopyDirCommand < BaseCommand
      def initialize(from, to)
        @from = from
        @to = to
      end

      def go
        FileUtils.cp_r(Dir["#{ @from }/*"], @to)
      end
    end
  end
end