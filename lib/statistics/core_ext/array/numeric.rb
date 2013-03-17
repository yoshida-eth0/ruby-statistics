module Statistics
  module CoreExt
    module Array
      module Numeric
        # 算術平均（相加平均）
        def arithmetic_mean
          self.inject(0.0){|sum,v| sum + v} / self.length
        end

        # 幾何平均（相乗平均）
        def geometric_mean
          self.inject(1.0){|mul,v| mul * v} ** (1.0 / self.length)
        end

        # 調和平均
        def harmonic_mean
          self.length / self.inject(0.0){|sum,v| sum + 1.0 / v}
        end

        # 中央値
        def median
          values = self.sort
          if (values.length%2)==1
            # データ数が奇数
            values[(values.length-1)/2]
          else
            # データ数が偶数
            v1 = values[values.length/2-1]
            v2 = values[values.length/2]
            (v1 + v2) / 2.0
          end
        end

        # 最頻値
        def mode
          value_count_list = self.inject({}) {|h,v|
            h[v] ||= 0
            h[v] += 1
            h
          }
          max = value_count_list.values.max
          value_count_list.select{|v,c| c==max}.map{|v,c| v}
        end

        # 標準偏差
        def standard_deviation(type)
          case type
          when :population
            population_standard_deviation
          when :sample
            sample_standard_deviation
          else
            raise ArgumentError, "type is not valid: #{type}"
          end
        end

        # 母標準偏差
        def population_standard_deviation
          mean = arithmetic_mean
          sum = self.inject(0.0){|sum, v| sum + (v - mean) ** 2}
          Math.sqrt(sum / self.length)
        end

        # 標本標準偏差
        def sample_standard_deviation
          mean = arithmetic_mean
          sum = self.inject(0.0){|sum, v| sum + (v - mean) ** 2}
          Math.sqrt(sum / (self.length - 1))
        end

        # 基準値
        def standard_value(value, type=:sample)
          (value - arithmetic_mean) / standard_deviation(type)
        end

        # 基準値の配列
        def standard_values(type=:sample)
          mean = arithmetic_mean
          deviation = standard_deviation(type)

          self.map{|value| (value - mean) / deviation}
        end

        # 偏差値
        def standard_score(value, type=:sample)
          standard_value(value, type) * 10 + 50;
        end

        # 偏差値の配列
        def standard_scores(type=:sample)
          standard_values(type).map{|value| value * 10 + 50}
        end
      end
    end
  end
end
