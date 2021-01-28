# frozen_string_literal: true

module StrictTodo
  class FindFile
    private_class_method :new

    class << self
      #
      # @param [StrictTodo::Config] config YamlロードされHash化されたConfig情報
      # @param [String] base_dir 起点となるディレクトリ
      #
      # @return [Array<String>] ファイルのパス情報
      #
      def perform(config:, base_dir:)
        results = []
        Dir.glob('**/*', File::FNM_DOTMATCH, base: base_dir) do |path|
          # ディレクトリならば更に再起探索を行う
          if File.directory?(path)
            next
          end

          if acceptable?(dir_path: path, config: config)
            results.push(path)
          end
        end
        results
      end

      private

      #
      # @param [String] dir_path ディレクトリパス
      # @param [StrictTodo::Config] config YamlロードされHash化されたConfig情報
      #
      def acceptable?(dir_path:, config:)
        return false if not config.permit_extensions.include?(File.extname(dir_path))
        return false if config.exclude_match.include?(dir_path.split("/").first)

        true
      end
    end
  end
end
