# 階級
module Statistics
  class Classifier
    attr_reader :lower_limit

    def initialize(sclss, lower_limit)
      @sclss = sclss
      @lower_limit = lower_limit
    end

    def upper_limit
      lower_limit + @sclss.step
    end

    # 階級値
    def class_value
      lower_limit + (upper_limit - lower_limit) * 0.5
    end

    # 度数
    def frequency
      members.length
    end

    # 相対度数
    def relative_frequency
      total_len = @sclss.h.length * 1.0
      frequency / total_len
    end

    # 属するデータ
    def members
      @sclss.h.select{|k,v| lower_limit<=v && v<upper_limit}.map{|k,v| k}
    end
  end
end
