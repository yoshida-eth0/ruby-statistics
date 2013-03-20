module Statistics
  class NormalDistribution
    #include Enumerable

    def initialize(arithmetic_mean, standard_deviation)
      @arithmetic_mean = arithmetic_mean
      @standard_deviation = standard_deviation
    end

    def base
      @base ||= Math::sqrt(Math::PI * 2) * @standard_deviation
    end

    def func(x)
      Math::exp(-0.5 * (((x.to_f - @arithmetic_mean) / @standard_deviation) ** 2)) / base
    end
  end
end
