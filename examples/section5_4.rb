#!/usr/bin/ruby

# 第5章 確立を求めよう！
# 4. カイ二乗分布

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

# カイ二乗分布出力
puts "カイ二乗分布"
puts

def print_chi_squared_distribution(degrees_of_freedom, max_x)
  puts "自由度が#{degrees_of_freedom}の場合"
  puts "   x           y  ヒストグラム"

  csd = Statistics::ChiSquaredDistribution.new(degrees_of_freedom)
  (0..max_x).step(1) {|x|
    y = csd.func(x)
    puts sprintf("%4.1f   %8.7f  %s", x, y, "#"*(y*200).round)
  }
  puts
end

print_chi_squared_distribution(2, 20)
print_chi_squared_distribution(10, 40)
print_chi_squared_distribution(20, 40)
