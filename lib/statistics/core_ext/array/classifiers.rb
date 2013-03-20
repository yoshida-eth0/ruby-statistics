module Statistics
  module CoreExt
    module Array
      module Classifiers
        # スタージェスの公式
        def sturges_formula
          1 + Math.log10(self.length) / Math.log10(2)
        end

        # スタージェスの公式から求まる値を階級の個数をする度数分布
        def sturges_frequency
          max = self.max.to_f
          min = self.min.to_f
          step = ((max - min) / sturges_formula.round).round

          h = {}
          self.length.times{|i| h[i] = self[i]}

          Statistics::Classifiers.new(h, step, base)
        end

        # 度数分布
        def classifiers(step, base=0)
          h = {}
          self.length.times{|i| h[i] = self[i]}

          Statistics::Classifiers.new(h, step, base)
        end
      end
    end
  end
end
