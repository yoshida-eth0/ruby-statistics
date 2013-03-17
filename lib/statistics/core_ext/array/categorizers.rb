module Statistics
  module CoreExt
    module Array
      module Categorizers
        def categorizers
          h = {}
          self.length.times{|i| h[i] = self[i]}

          Statistics::Categorizers.new(h)
        end
      end
    end
  end
end
