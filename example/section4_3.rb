#!/usr/bin/ruby

# 第4章 基準化と基準値
# 3. 偏差値

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

# 教科ごとの偏差値
nihonshi_standard_scores = nihonshi_scores.standard_scores(:population)
seibutsu_standard_scores = seibutsu_scores.standard_scores(:population)

puts "         日本史 生物 日本史の偏差値 生物の偏差値"
scores.each_with_index do |score, i|
  nihonshi_standard_score = nihonshi_standard_scores[i]
  seibutsu_standard_score = seibutsu_standard_scores[i]

  puts sprintf("%-8s %6d %4d % 14.2f % 12.2f", score.name, score.nihonshi, score.seibutsu, nihonshi_standard_score, seibutsu_standard_score)
end

puts sprintf("平均       %2.1f %2.1f % 14.1f % 12.1f", nihonshi_scores.arithmetic_mean, seibutsu_scores.arithmetic_mean, nihonshi_standard_scores.arithmetic_mean, seibutsu_standard_scores.arithmetic_mean)
puts sprintf("標準偏差   %2.1f %2.1f % 14.1f % 12.1f", nihonshi_scores.population_standard_deviation, seibutsu_scores.population_standard_deviation, nihonshi_standard_scores.population_standard_deviation, seibutsu_standard_scores.population_standard_deviation)
