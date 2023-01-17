module Tmdb
  class Struct < OpenStruct
    def initialize(data=nil)
      @table = {}

      if data
        data.each do |k,v|
          set_ostruct_member_value! k, analyze_value(v)
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
