require 'slidr/configurator'
require 'slidr/config'
require 'slidr/commands/void_executor'
require 'slidr/commands/create_dir_command'
require 'slidr/commands/copy_file_command'
require 'slidr/commands/copy_dir_command'
require 'slidr/commands/return_executor'
require 'slidr/commands/insert_command'
require 'slidr/commands/slide_command'
require 'slidr/commands/save_to_file_command'

module Slidr
  include Slidr::Commands

  def self.config
    @@config = Config.new
    yield Configurator.new(@@config)
    self
  end

  def self.start
    @@config.outputs.each do |out|
      content = File.read(@@config.base.html)
      VoidExecutor.new
          .add(CreateDirCommand.new(out.path))
          .add(CopyFileCommand.new(@@config.base.remark, out.path))
          .add(CopyFileCommand.new(@@config.base.structure, out.path))
          .add(CopyDirCommand.new(@@config.layouts[out.layout.to_sym], out.path))
          .go

      remark = @@config.base.remark[@@config.base.remark.rindex('/')+1..-1]
      structure = @@config.base.structure[@@config.base.structure.rindex('/')+1..-1]
      slides = []
      @@config.slides.each do |path|
        File.read(path).split(/(?=^---$)/).each do |slide|
          slides << slide.strip
        end
      end

      ReturnExecutor.new(content)
          .add(InsertCommand.new('{{TITLE}}', out.title))
          .add(InsertCommand.new('{{REMARK_PATH}}', remark))
          .add(InsertCommand.new('{{STRUCTURE_PATH}}', structure))
          .add(InsertCommand.new('{{SCRIPT_INIT}}', @@config.base.script))
          .add(SlideCommand.new('{{MARKDOWN}}', slides, { publish: out.publish, draft: out.draft }))
          .add(SaveToFileCommand.new("#{ out.path }/#{ out.name }"))
          .go
    end
  end
end
