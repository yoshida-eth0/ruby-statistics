module Statistics
  class ChiSquaredDistribution
    def initialize(degrees_of_freedom)
      @degrees_of_freedom = degrees_of_freedom.to_f
    end

    def func(x)
      if 0.0<x
        1.0 / (2.0 ** (@degrees_of_freedom / 2.0) * Math::gamma(@degrees_of_freedom / 2.0)) * x ** (@degrees_of_freedom / 2.0 - 1) * Math::exp(-x/2.0)
      else
        0.0
      end
    end
  end
end
