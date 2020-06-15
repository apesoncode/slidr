require 'slidr/configurators/base'
require 'slidr/configurators/slide'
require 'slidr/configurators/layout'
require 'slidr/configurators/output'

require 'slidr/defaults'

module Slidr
  class Configurator

    def initialize(config)
      @config = config
    end
    
    def base(&block)
      base = Configurators::Base.new(@config)
      base.evaluate(&block)
    end

    def slides(path=Slidr::Defaults::PATH, &block)
      if path.is_a?(Hash)
        if path.has_key?(:is)
          path = path[:is]
        elsif path.has_key?(:path)
          path = path[:path]
        else
          raise ArgumentError.new "Invalid argument: #{ path }"
        end
      end

      slide = Configurators::Slide.new(@config)
      slide.evaluate(&block)

      arr = []
      @config.slides.each do |slide|
        arr << "#{ path }/#{ slide }"
      end
      @config.slides = arr
    end

    def layouts(&block)
      layout = Configurators::Layout.new(@config)
      layout.evaluate(&block)
    end

    def outputs(args, &block)
      yield Configurators::Output.new(@config)
    end

  end
end