module Statistics
  module CoreExt
    module Array
      module CorrelationRatio
        def correlation_ratio
          (val1, val2) = self[0]
          if val2.is_a?(Numeric)
            cat_num_correlation_ratio
          else
            num_cat_correlation_ratio
          end
        end

        def cat_num_correlation_ratio
          Statistics::CorrelationRatio.new_with_cat_num_array(self)
        end

        def num_cat_correlation_ratio
          Statistics::CorrelationRatio.new_with_num_cat_array(self)
        end
      end
    end
  end
end
