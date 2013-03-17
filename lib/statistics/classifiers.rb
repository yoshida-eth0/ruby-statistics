# 階級の配列
module Statistics
  class Classifiers
    attr_reader :h, :step, :base

    include Enumerable

    def initialize(h, step, base=0)
      if step==0
        raise ArgumentError.new("step is not allow zero")
      end
      @h = h
      @step = step
      @base = base % step
    end

    # valuesの最小値を含む階級の最小値
    def value_min
      included_class_lower_limit(@h.values.min)
    end

    # valuesの最大値を含む階級の最小値
    def value_max
      included_class_lower_limit(@h.values.max)
    end

    # valueを含む階級の最小値
    def included_class_lower_limit(value)
      lower = value - (value % @step) + @base
      if value<lower
        lower -= @step
      end
      lower
    end

    # 階級の最小値をイテレーション
    def each_step
      (value_min .. value_max).step(@step) {|lower_limit|
        yield lower_limit
      }
    end

    # 階級をイテレーション
    def each
      each_step {|lower_limit|
        scls = Classifier.new(self, lower_limit)
        yield scls
      }
    end

    # valueを含む階級を返す
    def fetch(value)
      lower_limit = included_class_lower_limit(value)
      Classifier.new(self, lower_limit)
    end

    # rangeに含まれる階級をイテレーション
    def each_range(range)
      range.step(@step) {|value|
        yield fetch(value)
      }
    end
  end
end
