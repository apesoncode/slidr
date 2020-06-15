require 'slidr/commands/base_command'

module Slidr
  module Commands
    class SlideCommand < BaseCommand
      def initialize(pattern, slides, filters={})
        @pattern = pattern
        @slides = slides
        @publish = filters[:publish]
        @draft = filters[:draft]
      end

      def go(content)

        slides = []
        if @publish == :all
          slides = @slides
        else
          @slides.each do |slide|
            class_attrib = slide.lines.grep(/^class: [a-zA-Z0-9 ,:-]+$/)
            if @publish.any? { |cond| class_attrib.empty? ? false : class_attrib.first.include?(":#{ cond }") }
              slides << slide
            end
          end
        end

        slides = slides.map { |slide| slide.sub(/^---$/, '').strip }.join("\n---\n")
        content.sub(@pattern, slides)
      end

    end
  end
end