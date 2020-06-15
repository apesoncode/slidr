
module Slidr
  class SlideFilter
    def initialize(slides)
      @slides = slides
    end

    def filter(condition, draft=false)
      slides = []
      @slides.each do |slide|
        if condition == :all
          slides << remove_level(slide)
        else
          p condition
          class_line = slide.lines.grep(/^class: ((:?[a-zA-Z0-9]+),\s){0,}(:?[a-zA-Z0-9]+)$/)
          p class_line
          if condition.any? { |cond| class_line.first.include?("#{cond}") if !class_line.empty? }
            slides << '---' if !slide.start_with?('---')
            slides << slide
          end
        end
      end

      slides.join("\n---")
    end

    private
    def remove_level(slide)
      content = ''
      slide.lines.each do |line|
        if /^class: ((:?[a-zA-Z0-9]+),\s){0,}(:?[a-zA-Z0-9]+)$/.match?(line)
          line = line.sub(/:\w+/, '')
        end
        content << line
      end
    end
  end
end