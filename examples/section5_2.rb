#!/usr/bin/ruby

# 第5章 確立を求めよう！
# 2. 正規分布

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

# 正規分布出力
def print_normal_distribution(mean, deviation)
  puts "平均が#{mean}で標準偏差が#{deviation}"

  nd = Statistics::NormalDistribution.new(mean, deviation)
  (0..100).step(5) {|x|
    y = nd.func(x)
    puts sprintf("%3d %8.7f %s", x, y, "#"*(y*1000).round)
  }
  puts
end

print_normal_distribution(53, 15)
print_normal_distribution(53, 5)
print_normal_distribution(30, 5)
