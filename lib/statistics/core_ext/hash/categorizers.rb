module Statistics
  module CoreExt
    module Hash
      module Categorizers
        def categorizers
          Statistics::Categorizers.new(self)
        end
      end
    end
  end
end
