#!/usr/bin/ruby

# 第2章 データ全体の雰囲気をつかもう！＜数量データ編＞
# 1. 度数分布表とヒストグラム

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

num_hash = {}
num_hash[:ramen01] = 700
num_hash[:ramen02] = 850
num_hash[:ramen03] = 600
num_hash[:ramen04] = 650
num_hash[:ramen05] = 980
num_hash[:ramen06] = 750
num_hash[:ramen07] = 500
num_hash[:ramen08] = 890
num_hash[:ramen09] = 880
num_hash[:ramen10] = 700
num_hash[:ramen11] = 890
num_hash[:ramen12] = 720
num_hash[:ramen13] = 680
num_hash[:ramen14] = 650
num_hash[:ramen15] = 790
num_hash[:ramen16] = 670
num_hash[:ramen17] = 680
num_hash[:ramen18] = 900
num_hash[:ramen19] = 880
num_hash[:ramen20] = 720
num_hash[:ramen21] = 850
num_hash[:ramen22] = 700
num_hash[:ramen23] = 780
num_hash[:ramen24] = 850
num_hash[:ramen25] = 750
num_hash[:ramen26] = 780
num_hash[:ramen27] = 590
num_hash[:ramen28] = 650
num_hash[:ramen29] = 580
num_hash[:ramen30] = 750
num_hash[:ramen31] = 800
num_hash[:ramen32] = 550
num_hash[:ramen33] = 750
num_hash[:ramen34] = 700
num_hash[:ramen35] = 600
num_hash[:ramen36] = 800
num_hash[:ramen37] = 800
num_hash[:ramen38] = 880
num_hash[:ramen39] = 790
num_hash[:ramen40] = 790
num_hash[:ramen41] = 780
num_hash[:ramen42] = 600
num_hash[:ramen43] = 670
num_hash[:ramen44] = 680
num_hash[:ramen45] = 650
num_hash[:ramen46] = 890
num_hash[:ramen47] = 930
num_hash[:ramen48] = 650
num_hash[:ramen49] = 777
num_hash[:ramen50] = 700

puts "以上 ~ 未満  階級値  度数  相対度数  その階にある店"
classifiers = num_hash.classifiers(100)
classifiers.each do |classifier|
  puts sprintf("%4d ~ %4d %7d %5d %9.2f  %s", classifier.lower_limit, classifier.upper_limit, classifier.class_value, classifier.frequency, classifier.relative_frequency, classifier.members.join(" "))
end
puts

puts "以上 ~ 未満  階級値  度数  相対度数  その階にある店"
classifiers =  num_hash.sturges_frequency
classifiers.each do |classifier|
  puts sprintf("%4d ~ %4d %7d %5d %9.2f  %s", classifier.lower_limit, classifier.upper_limit, classifier.class_value, classifier.frequency, classifier.relative_frequency, classifier.members.join(" "))
end
