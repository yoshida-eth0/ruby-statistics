module Statistics
  module CoreExt
    module Array
      module NormalDistribution
        def normal_distribution(type=:population)
          Statistics::NormalDistribution.new(self.arithmetic_mean, self.standard_deviation(type))
        end
      end
    end
  end
end
