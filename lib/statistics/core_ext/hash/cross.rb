require 'set'

module Statistics
  module CoreExt
    module Hash
      module Cross
        # 2段dup
        def cross_dup
          h = self.dup
          h.each do |k,v|
            h[k] = v.dup
          end
          h
        end

        # cross
        def x_total
          self.inject({}){|h,(xk,yh)| h.update({xk=>yh.values.inject(:+)})}
        end

        def y_keys
          self.inject(Set.new){|s,(xk,yh)| s.merge(yh.keys)}
        end

        def y_total
          y_keys.inject({}){|h,yk|
            h[yk] = self.inject(0.0){|f,(xk,yh)| f + (yh[yk] ? yh[yk] : 0)}
            h
          }
        end

        def y_length
          self.map{|xk,yh| yh.length}.max
        end


        # 横％
        def cross_percent
          self.cross_dup.cross_percent!
        end

        def cross_percent!
          self.each do |k,h|
            h_total = h.values.inject(:+)
            h.each do |h_k, h_v|
              h[h_k] = h_v.to_f/h_total*100
            end
          end
          self
        end

        # 期待度数
        def expected_frequency
          self.cross_dup.expected_frequency!
        end

        def expected_frequency!
          x_total_h = self.x_total
          y_total_h = self.y_total
          xy_total = x_total_h.values.inject(:+)

          self.each do |xk,yh|
            yh.each do |yk,v|
              yh[yk] = x_total_h[xk] * y_total_h[yk] / xy_total
            end
          end
          self
        end

        # ピアソンのカイ二乗統計量
        def pearsons_chi_square
          expected_freq = self.expected_frequency
          y_keys = self.y_keys

          f = 0.0
          self.each do |xk,yh|
            yh.each do |yk,v|
              ex = expected_freq[xk][yk]
              f += (v - ex)**2 / ex
            end
          end
          f
        end

        # クラメールの連関係数
        def cramers_coefficient
          xy_total = x_total.values.inject(:+)
          Math.sqrt(pearsons_chi_square / (xy_total * ([self.length, y_length].min - 1)))
        end
      end
    end
  end
end
