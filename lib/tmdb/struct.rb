# frozen_string_literal: true
module Tmdb
    class Struct < OpenStruct
        def initialize(data = nil)
            @table = {}
            if data.is_a?(Array)
                data.each do |x|
                    makemap(x)
                end
            else
                makemap(data)
            end
        end

        def makemap(datas)
            datas&.each do |k, v|
                @table[k.to_sym] = analyze_value(v)
                new_ostruct_member(k)
            end
        end

        def analyze_value(v)
            if v.is_a?(Hash)
                self.class.new(v)
            elsif v.is_a?(Array)
                v.map do |element|
                    analyze_value(element)
                end
            else
                v
            end
        end
      end
end
