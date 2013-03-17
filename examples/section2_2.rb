#!/usr/bin/ruby

# 第2章 データ全体の雰囲気をつかもう！＜数量データ編＞
# 2. 平均
# 3. 中央値
# 4. 標準偏差

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

team_a = [
  [:ruirui, 86],
  [:jun, 73],
  [:yumi, 124],
  [:shizuka, 111],
  [:tooko, 90],
  [:kaede, 38],
]

team_b = [
  [:tommy, 84],
  [:hatsu, 71],
  [:hana, 103],
  [:mei, 85],
  [:kana, 90],
  [:asami, 89],
]

team_c = [
  [:shinobu, 229],
  [:yuki, 77],
  [:hitomi, 59],
  [:risako, 95],
  [:mai, 70],
  [:kozue, 88],
]

[["Aチーム", team_a], ["Bチーム", team_b], ["Cチーム", team_c]].each do |name, team|
  puts name
  puts "        スコア"
  team.each do |member, score|
    puts sprintf("%-8s %5d", member, score)
  end
  puts

  scores = team.map{|member,score| score}

  puts "算術平均（相加平均） #{scores.arithmetic_mean}"
  puts "幾何平均（相乗平均） #{scores.geometric_mean}"
  puts "調和平均             #{scores.harmonic_mean}"
  puts "中央値               #{scores.median}"
  puts "最頻値               #{scores.mode.join(" ")}"
  puts "母標準偏差           #{scores.population_standard_deviation}"
  puts "標本標準偏差         #{scores.sample_standard_deviation}"
  puts "偏差値50             #{scores.standard_score(50)}"
  puts "偏差値100            #{scores.standard_score(100)}"
  puts
  puts "=========="
  puts
end
