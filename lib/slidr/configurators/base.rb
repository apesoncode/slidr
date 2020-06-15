
require 'iamsure'

# require 'slidr/helpers/path_unpacker'
# require 'slidr/helpers/script_unpacker'

module Slidr
  module Configurators
    class Base

      def initialize(config)
        # IamSure.of(config).not_nil("argument cannot be null")
        @config = config
      end

      def evaluate(&block)
        instance_eval &block
      end

      private
      def remark(arg)
        # IamSure.of(arg)
        #  .not_nil('remark path is nil!')
        #  .unpack(Slidr::Helpers::PathUnpacker.new)
        #  .not_empty("remark's path cannot be empty")
        #  .exist(as: :file)
        @config.base.remark = arg[:is]
      end

      def html(arg)
        # IamSure.of(arg)
        #  .not_nil('html path is nil!')
        #  .unpack(Slidr::Helpers::PathUnpacker.new)
        #  .not_empty("html's path cannot be empty")
        #  .exist(as: :file)
        #  .get
        @config.base.html = arg[:is]
      end

      def structure(arg)
        @config.base.structure = arg[:is]
      end

      def script(arg)
        # IamSure.of(arg)
        #   .unpack(Slidr::Helpers::ScriptUnpacker.new)
        #   .get()
        @config.base.script = arg[:is]
      end

    end
  end
end