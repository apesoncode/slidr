
module Slidr
  module Configurators
    class Slide
      def initialize(config)
        @config = config
      end

      def evaluate(&block)
        instance_eval &block
      end
      
      private
      def order(arg)
        @config.slides.push(*arg[:is])
      end

      def after(slide)
        @config.slides << slide[:then]
      end
    end
  end
end