# frozen_string_literal: true

require 'yaml'

module StrictTodo
  class Config
    private_class_method :new

    COMMON = YAML.safe_load(File.read("./strict_config.yml")).fetch("common").freeze

    # @return [Array] 除外対象
    attr_reader :exclude_match
    # @return [Array] 検索対象の拡張子
    attr_reader :permit_extensions

    def initialize
      @exclude_match = COMMON.fetch("exclude")
      @permit_extensions = COMMON.fetch("extension")
    end

    class << self
      def load
        return new.freeze()
      end
    end
  end
end
