#!/usr/bin/ruby

# 第6章 2変数の関連を調べよう！
# 2. 相関比

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

members = {
  :Asan => [27, :hermes],
  :Bsan => [33, :chanel],
  :Csan => [16, :burberry],
  :Dsan => [29, :burberry],
  :Esan => [32, :chanel],
  :Fsan => [23, :hermes],
  :Gsan => [25, :chanel],
  :Hsan => [28, :hermes],
  :Isan => [22, :burberry],
  :Jsan => [18, :burberry],
  :Ksan => [26, :chanel],
  :Lsan => [26, :hermes],
  :Msan => [15, :burberry],
  :Nsan => [29, :chanel],
  :Osan => [26, :burberry],
}

puts "     年齢 ブランド"
members.each_pair do |member,(age,brand)|
  puts sprintf("%-5s %3d %s", member, age, brand)
end

cr = members.values.correlation_ratio
puts "相関比: #{cr.score}"
