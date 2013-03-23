module Statistics
  module CoreExt
    module Array
      module CorrelationCoefficient
        def correlation_coefficient
          Statistics::CorrelationCoefficient.new(self)
        end
      end
    end
  end
end
