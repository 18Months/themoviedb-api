module Tmdb
  class Struct < OpenStruct
    def initialize(data=nil)
      @table = {}

      if data
        if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('3.0.0')
          data.each do |k,v|
            set_ostruct_member_value! k, analyze_value(v)
          end
        else
          data.each do |k,v|
            @table[k.to_sym] = analyze_value(v)

            new_ostruct_member!(k)
          end
        end
      end
    end

    def analyze_value(v)
      case v
        when Hash
          self.class.new(v)
        when Array
          v.map do |element|
            analyze_value(element)
          end
        else
          v
      end
    end
  end
end
