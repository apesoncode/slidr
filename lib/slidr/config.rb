require 'ostruct'

module Slidr
    class Config
        attr_accessor :base, :slides, :layouts, :outputs

        def initialize
            @base = OpenStruct.new(
                remark: "../../../#{ Slidr::Defaults::REMARK_PATH }", 
                html: "../../../#{ Slidr::Defaults::HTML_PATH }",
                structure: "../../../#{ Slidr::Defaults::STRUCTURE_PATH }",
                script: Slidr::Defaults::SCRIPT)
            @slides = []
            @layouts = {}
            @outputs = []
        end
    end
end