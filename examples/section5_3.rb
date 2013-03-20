#!/usr/bin/ruby

# 第5章 確立を求めよう！
# 2. 標準正規分布

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

# 標準正規分布出力
puts "標準正規分布"
puts "   x           y  0~xになる確立  ヒストグラム"

nd = Statistics::NormalDistribution.standard
(-4..4).step(0.1) {|x|
  y = nd.func(x)
  puts sprintf("%4.1f   %8.7f     % 8.7f  %s", x, y, nd.normdist(x), "#"*(y*100).round)
}
