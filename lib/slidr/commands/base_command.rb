
module Slidr
  module Commands
    class BaseCommand
      def execute(*args)
        raise 'Must be implemented!'
      end
    end
  end
end