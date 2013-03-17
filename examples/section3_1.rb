#!/usr/bin/ruby

# 第3章 データ全体の雰囲気をつかもう！＜カテゴリーデータ編＞
# 1 単純集計表

$LOAD_PATH << File.expand_path(__FILE__+"/../../lib")
require 'statistics'
require 'statistics/core_ext'

enquete = {}

enquete[1] = :suki
enquete[2] = :dotira_tomo_ienai
enquete[3] = :suki
enquete[4] = :dotira_tomo_ienai
enquete[5] = :kirai
enquete[6] = :suki
enquete[7] = :suki
enquete[8] = :suki
enquete[9] = :suki
enquete[10] = :suki
enquete[11] = :suki
enquete[12] = :suki
enquete[13] = :dotira_tomo_ienai
enquete[14] = :suki
enquete[15] = :suki

enquete[16] = :dotira_tomo_ienai
enquete[17] = :suki
enquete[18] = :suki
enquete[19] = :suki
enquete[20] = :suki
enquete[21] = :suki
enquete[22] = :suki
enquete[23] = :kirai
enquete[24] = :dotira_tomo_ienai
enquete[25] = :suki
enquete[26] = :suki
enquete[27] = :kirai
enquete[28] = :suki
enquete[29] = :suki
enquete[30] = :suki

enquete[31] = :dotira_tomo_ienai
enquete[32] = :dotira_tomo_ienai
enquete[33] = :suki
enquete[34] = :kirai
enquete[35] = :suki
enquete[36] = :suki
enquete[37] = :suki
enquete[38] = :suki
enquete[39] = :dotira_tomo_ienai
enquete[40] = :suki

puts "                   度数 割合"
enquete.categorizers.each do |categorizer|
  puts sprintf("%-20s %2d %4d  %s", categorizer.category, categorizer.frequency, categorizer.percent*100, categorizer.members.sort.join(" "))
end
