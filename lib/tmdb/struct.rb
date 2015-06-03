module Tmdb
  class Struct < OpenStruct
    @@resource = 'null'

    def initialize(hash=nil)
      @table = {}
      @hash_table = hash.symbolize_keys

      if hash
        hash.each do |k,v|
          @table[k.to_sym]      = (v.is_a?(Hash) ? self.class.new(v) : v)
          @hash_table[k.to_sym] = (v.is_a?(Hash) ? v.symbolize_keys  : v)

          new_ostruct_member(k)
        end
      end
    end

    def self.run
      puts @@resource
    end

    def analyze_value(element)
      case element.class
      when Hash
        self.class.new(element)
      when Array
        element.map do |value|
          analyze_value(value)
        end
      else
        element
      end
    end

    def to_h
      @hash_table
    end

  end
end
