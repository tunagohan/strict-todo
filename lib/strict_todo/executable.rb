# frozen_string_literal: true

require_relative 'config'
require_relative 'find_file'
require_relative 'find_word'
require_relative 'checker'



module StrictTodo
  class Executable
    private_class_method :new

    class << self
      def perform
        results = {}

        config = StrictTodo::Config.load
        files = StrictTodo::FindFile.perform(config: config, base_dir: '.')

        files.each do |file|
          results.update(StrictTodo::FindWord.perform(file_path: file))
        end

        results.each_key do |key|
          error = StrictTodo::Checker.perform(line: results[key][:description])
          results[key][:error] = error
        end

        output(objects: results)
      end

      private

      def output(objects:)
        objects.each_key do |key|
          if objects[key][:error].nil?
            puts "#{objects[key][:header]} \e[1m\e[32mSuccess\e[0m\n=> #{objects[key][:description]}\n\e[0m"
          else
            puts "#{objects[key][:header]} \e[1m\e[31m#{objects[key][:error]}\e[0m\n=> #{objects[key][:description]}\n\e[0m"
          end
        end
      end
    end
  end
end
