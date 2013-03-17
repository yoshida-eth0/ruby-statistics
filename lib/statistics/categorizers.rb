module Statistics
  class Categorizers
    attr_reader :h

    include Enumerable

    def initialize(h)
      @h = h
    end

    def each
      @h.values.uniq.each do |category|
        yield Categorizer.new(self, category)
      end
    end
  end
end
