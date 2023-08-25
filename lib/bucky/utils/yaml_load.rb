# frozen_string_literal: true

require 'psych'
require 'erb'

module Bucky
  module Utils
    module YamlLoad
      # Load yaml(include erb)
      # @param [File] yaml file
      # @return [Hash] hashed yaml contents
      def load_yaml(file)
        Psych.safe_load(ERB.new(File.read(file)).result, permitted_classes: [Array, Hash, String, Numeric, Symbol, TrueClass, FalseClass], permitted_symbols: [], aliases: true)
      end

      # Sort files to hierarchy
      # @param [String] path of directory
      # @return [Array] sorted files
      def file_sort_hierarchy(path)
        Dir.glob(path).sort_by { |f| f.split('/').size }
      end
    end
  end
end
