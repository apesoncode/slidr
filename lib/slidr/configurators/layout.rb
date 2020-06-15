
module Slidr
  module Configurators
    class Layout
      def initialize(config)
        @config = config
      end

      def evaluate(&block)
        instance_eval &block
      end

      private
      def layout(args)
        @config.layouts[args.keys.first.to_sym] = args.values.first.to_s
      end
    end
  end
end