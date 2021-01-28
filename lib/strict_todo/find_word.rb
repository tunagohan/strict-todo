# frozen_string_literal: true

module StrictTodo
  class FindWord
    private_class_method :new

    class << self
      def perform(file_path:)
        results = {}
        File.readlines(file_path, chomp: true).each.with_index(1) do |line, index|
          if line.include?('TODO')
            results["#{file_path}:#{index.to_s}"] = {
              header: extraction_todo(file_path: file_path, index: index),
              description: line
            }
          end

          if line.include?('FIXME')
            results["#{file_path}:#{index.to_s}"] = {
              header: extraction_fixme(file_path: file_path, index: index),
              description: line
            }
          end
        end
        results
      end

      private

      def extraction_todo(file_path:, index:)
        "TODO(#{file_path}:#{index})"
      end

      def extraction_fixme(file_path:, index:)
        "FIXME(#{file_path}:#{index})"
      end
    end
  end
end
