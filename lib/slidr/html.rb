require 'fileutils'

module Slidr
  class Html
    def initialize(args)
      @html_path = args[:html]
      @name = args[:name]
      @path = args[:path]
      @draft = args[:draft]
      @commands = []
    end

    def add(command)
      @commands << command
      self
    end

    def generate

      unless File.directory?(@path)
        FileUtils.mkdir_p(@path)
      end

      FileUtils.cp(@inserts[:remark], @path)
      FileUtils.cp(@inserts[:structure], @path)

      FileUtils.cp_r(Dir["#{ @inserts[:layout] }/*"], @path)

      content = File.read(@html_path)
      content.gsub!('{{TITLE}}', @inserts[:title])
      content.gsub!('{{MARKDOWN}}', @inserts[:slides])
      content.gsub!('{{REMARK_PATH}}', @inserts[:remark][@inserts[:remark].rindex('/')+1..-1])
      content.gsub!('{{STRUCTURE_PATH}}', @inserts[:structure][@inserts[:structure].rindex('/')+1..-1])
      content.gsub!('{{SCRIPT_INIT}}', @inserts[:script])

      File.open("#{ @path }/#{ @name }", "w") do |file| 
        file.puts content
      end


            
    end
  end
end