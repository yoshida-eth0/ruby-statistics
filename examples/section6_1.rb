#!/usr/bin/ruby

# 第6章 2変数の関連を調べよう！
# 1. 単相関係数

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

members = {
  :Asan => [3000, 7000],
  :Bsan => [5000, 8000],
  :Csan => [12000, 25000],
  :Dsan => [2000, 5000],
  :Esan => [7000, 12000],
  :Fsan => [15000, 30000],
  :Gsan => [5000, 10000],
  :Hsan => [6000, 15000],
  :Isan => [8000, 20000],
  :Jsan => [10000, 18000],
}

puts "      化粧代 洋服代"
members.each_pair do |member,(kesho,yohuku)|
  puts sprintf("%-5s %6d %6d", member, kesho, yohuku)
end

cc = members.values.correlation_coefficient
puts "単相関係数: #{cc.score}"
