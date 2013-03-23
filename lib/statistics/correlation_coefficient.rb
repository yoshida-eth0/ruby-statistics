# 単相関係数
module Statistics
  class CorrelationCoefficient
    def initialize(arr)
      @arr = arr.dup
    end

    # Xの合計
    def x_sum
      @x_sum ||= @arr.map{|x,y| x}.inject(0){|s,x| s + x}
    end

    # Xの平均
    def x_mean
      @x_mean ||= x_sum.to_f / @arr.length
    end

    # Yの合計
    def y_sum
      @y_sum ||= @arr.map{|x,y| y}.inject(0){|s,y| s + y}
    end

    # Yの平均
    def y_mean
      @y_mean ||= y_sum.to_f / @arr.length
    end

    # Xの偏差平方和
    def sxx
      @sxx ||= @arr.map{|x,y| x}.inject(0){|s,x| s + (x - x_mean) ** 2}
    end

    # Yの偏差平方和
    def syy
      @syy ||= @arr.map{|x,y| y}.inject(0){|s,y| s + (y - y_mean) ** 2}
    end

    # XとYの積和
    def sxy
      @sxy ||= @arr.inject(0){|s,(x,y)| s + (x - x_mean) * (y - y_mean)}
    end

    # 単相関係数
    def score
      @score ||= 1.0 * sxy / Math::sqrt(sxx * syy)
    end
  end
end
