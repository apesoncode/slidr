require 'ostruct'

module Slidr
  module Configurators
    class Output
      def initialize(config)
        @config = config
      end

      def of(*args, &block)
        args.each do |layout|
          @config.outputs << OpenStruct.new(
              title: Slidr::Defaults::TITLE,
              layout: layout, 
              name: "#{ layout }.html", 
              path: "#{ Slidr::Defaults::OUTPUT_DIR }/#{ layout }", 
              draft: false, 
              publish: :all)
          instance_eval &block if block_given?
        end
      end

      private
      def title(arg)
        @config.outputs.last.title = arg
      end

      def name(arg)
        @config.outputs.last.name = arg
      end

      def path(arg)
        @config.outputs.last.path = arg
      end

      def draft(arg)
        @config.outputs.last.draft = arg
      end

      def publish(arg)
        arg = [] << arg if not arg.is_a?(Array)
        @config.outputs.last.publish = arg
      end

    end
  end
end