module Statistics
  module CoreExt
    module Hash
      module Classifiers
        # スタージェスの公式
        def sturges_formula
          1 + Math.log10(self.length) / Math.log10(2)
        end

        # スタージェスの公式から求まる値を階級の個数をする度数分布
        def sturges_frequency
          max = self.values.max.to_f
          min = self.values.min.to_f
          step = ((max - min) / sturges_formula.round).round

          Statistics::Classifiers.new(self, step, min)
        end

        # 度数分布
        def classifiers(step, base=0)
          Statistics::Classifiers.new(self, step, base)
        end
      end
    end
  end
end
