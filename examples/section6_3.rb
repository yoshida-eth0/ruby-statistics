#!/usr/bin/ruby

# 第6章 2変数の関連を調べよう！
# 3. クラメールの連関係数

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

members = {
  :female => {
    :tel => 34,
    :mail => 61,
    :meet => 53,
  },
  :male => {
    :tel => 38,
    :mail => 40,
    :meet => 74,
  },
}


def print_table(members, div_length=false)
  puts "       電話で メールで 直接会って  計"
  members.each_pair do |member,scores|
    total = scores.values.inject(:+)
    puts sprintf("%-6s %6d %8d %10d %3d", member, scores[:tel], scores[:mail], scores[:meet], total)
  end

  div = div_length ? members.length.to_f : 1.0
  tel_total = members.map{|k,h| h[:tel]}.inject(:+) / div
  mail_total = members.map{|k,h| h[:mail]}.inject(:+) / div
  meet_total = members.map{|k,h| h[:meet]}.inject(:+) / div
  total = members.map{|k,h| h.values.inject(:+)}.inject(:+) / div
  puts sprintf("計     %6d %8d %10d %3d", tel_total, mail_total, meet_total, total)
  puts
end


# 表出力
puts "「性別」と「されたい告白方法」のクラス集計表"
print_table(members)


# 横％表
puts "「性別」と「されたい告白方法」のクラス集計表（横％表）"
print_table(members.cross_percent, true)


# 期待度数
puts "「性別」と「されたい告白方法」のクラス集計表（期待度数）"
print_table(members.expected_frequency)

puts "クラメールの連関係数: #{members.cramers_coefficient}"
