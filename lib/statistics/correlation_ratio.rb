# 相関比
module Statistics
  class CorrelationRatio
    attr_reader :shuffle

    # {category => [numeric, numeric] ..}
    def initialize(h)
      @shuffle = h.dup
    end

    # Categoryごとの合計
    def reduce_sum
      @reduce_sum ||= shuffle.inject({}) {|h, (cat, nums)|
        h[cat] = nums.inject(:+)
        h
      }
    end

    # Categoryごとの平均
    def reduce_mean
      @reduce_mean ||= shuffle.inject({}) {|h, (cat, nums)|
        h[cat] = nums.inject(:+).to_f / nums.length
        h
      }
    end

    # 合計
    def sum
      @sum ||= reduce_sum.values.inject(:+)
    end

    # 平均
    def mean
      @mean ||= sum.to_f / shuffle.inject(0){|s,(cat,nums)| s + nums.length}
    end

    # 級内変動
    def within_class_variation
      @within_class_variation ||= shuffle.map {|cat, nums|
        cat_mean = nums.inject(:+).to_f / nums.length
        nums.map {|num| (num - cat_mean) ** 2}.inject(:+)
      }.inject(:+)
    end

    # 級間変動
    def between_class_variation
      @between_class_variation ||= shuffle.map {|cat, nums|
        a = nums.length * (nums.inject(:+).to_f / nums.length - mean) ** 2
      }.inject(:+)
    end

    def score
      between_class_variation / (within_class_variation + between_class_variation)
    end

    class << self
      # [[numeric, category], [numeric, category] ..]
      def new_with_num_cat_array(arr)
        shuffle ||= arr.inject({}){|h, (num, cat)|
          h[cat] ||= []
          h[cat] << num
          h
        }
        new(shuffle)
      end

      # [[category, numeric], [category, numeric] ..]
      def new_with_cat_num_array(arr)
        shuffle ||= arr.inject({}){|h, (cat, num)|
          h[cat] ||= []
          h[cat] << num
          h
        }
        new(shuffle)
      end
    end
  end
end
