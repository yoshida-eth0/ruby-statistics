module Statistics
  class Categorizer
    attr_reader :category

    def initialize(categorizers, category)
      @categorizers = categorizers
      @category = category
    end

    # 度数
    def frequency
      members.length
    end

    # 割合
    def percent
      1.0 * frequency / @categorizers.h.length
    end

    # 属するデータ
    def members
      a = @categorizers.h.select{|k,v| v==@category}.map{|k,v| k}
    end
  end
end
