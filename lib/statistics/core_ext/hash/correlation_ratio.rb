module Statistics
  module CoreExt
    module Hash
      module CorrelationRatio
        def correlation_ratio
          Statistics::CorrelationRatio.new(self)
        end
      end
    end
  end
end
