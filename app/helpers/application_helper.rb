## 何をするところかあまり分かってない
## ここではツイートした時間の表示の変更のメソッドを作っている



module ApplicationHelper
  def simple_time(time)
    time.strftime("%Y-%m-%d<br />&nbsp;&nbsp;&nbsp;&nbsp;%H:%M&nbsp;&nbsp;&nbsp;&nbsp;")
  end 

  # def day_of_the_week(time)
  #   youbi = (((%Y + %Y / 4) - (%Y / 100) + (%Y / 400)) + ((%m * 13 + 8) / 5) + (%d)) % 7
  #   case youbi
  #   when 0 then
  #     youbi = '日'
  #   when 1 then
  #     youbi = '月'
  #   when 2 then
  #     youbi = '火'
  #   when 3 then
  #     youbi = '水'
  #   when 4 then
  #     youbi = '木'
  #   when 5 then
  #     youbi = '金'
  #   when 6 then
  #     youbi = '土'
  #   else
  #     youbi = 'error'
  #   end
  # end
end
# 【年数】に、【年数】を4で割った数を足す
# 1. の結果から、【年数】を100で割った数を引く
# 2. の結果に、【年数】を400で割った数を足す
# 【月数】に13を掛け、8を足した数を計算し、それを5で割る
# 3. と 4. の結果を足す
# 5. の結果に【日数】を足す
# 6. の結果を7で割った数の余りを出す