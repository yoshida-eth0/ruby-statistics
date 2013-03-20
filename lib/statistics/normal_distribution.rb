# 正規分布
module Statistics
  class NormalDistribution
    #include Enumerable

    def initialize(arithmetic_mean, standard_deviation)
      @arithmetic_mean = arithmetic_mean.to_f
      @standard_deviation = standard_deviation.to_f
      @normdist = {}
    end

    def base
      @base ||= Math::sqrt(Math::PI * 2) * @standard_deviation
    end

    # 確率密度関数
    def func(x)
      Math::exp(-0.5 * (((x.to_f - @arithmetic_mean) / @standard_deviation) ** 2)) / base
    end

    # 確率変数が0〜xになる確立
    def normdist(x)
      key = (x*100).round
      @normdist[key] ||= Proc.new {
        res = 0.0
        ratio = 30.0

        i = 0
        f = 0.0
        t = x / ratio

        while i<ratio
          res += (func(f) + func(t)) * (t - f) / 2.0

          i = i + 1
          f += x / ratio
          t += x / ratio
        end

        res
      }.call
    end

    class << self
      def standard
        new(0, 1)
      end
    end
  end
end
