#!/usr/bin/ruby

# 第4章 基準化と基準値
# 1. 基準化と基準値

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

Score = Struct.new(:name, :nihonshi, :seibutsu)

scores = [
  Score.new(:Rui,   73,  59),
  Score.new(:Yumi,  61,  73),
  Score.new(:A,     14,  47),
  Score.new(:B,     41,  38),
  Score.new(:C,     49,  63),
  Score.new(:D,     87,  56),
  Score.new(:E,     69,  15),
  Score.new(:F,     65,  53),
  Score.new(:G,     36,  80),
  Score.new(:H,      7,  50),
  Score.new(:I,     53,  41),
  Score.new(:J,    100,  62),
  Score.new(:K,     57,  44),
  Score.new(:L,     45,  26),
  Score.new(:M,     56,  91),
  Score.new(:N,     34,  35),
  Score.new(:O,     37,  53),
  Score.new(:P,     70,  68),
]

# 教科ごとのスコア
nihonshi_scores = scores.map{|s| s.nihonshi}
seibutsu_scores = scores.map{|s| s.seibutsu}

# 教科ごとの基準値
nihonshi_standard_values = nihonshi_scores.standard_values(:population)
seibutsu_standard_values = seibutsu_scores.standard_values(:population)

puts "         日本史 生物 日本史の基準値 生物の基準値"
scores.each_with_index do |score, i|
  nihonshi_standard_value = nihonshi_standard_values[i]
  seibutsu_standard_value = seibutsu_standard_values[i]

  puts sprintf("%-8s %6d %4d % 14.2f % 12.2f", score.name, score.nihonshi, score.seibutsu, nihonshi_standard_value, seibutsu_standard_value)
end

puts sprintf("平均       %2.1f %2.1f % 14.1f % 12.1f", nihonshi_scores.arithmetic_mean, seibutsu_scores.arithmetic_mean, nihonshi_standard_values.arithmetic_mean, seibutsu_standard_values.arithmetic_mean)
puts sprintf("標準偏差   %2.1f %2.1f % 14.1f % 12.1f", nihonshi_scores.population_standard_deviation, seibutsu_scores.population_standard_deviation, nihonshi_standard_values.population_standard_deviation, seibutsu_standard_values.population_standard_deviation)
