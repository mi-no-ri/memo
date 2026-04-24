# CSVファイルを扱うためのライブラリを読み込む
require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

# ユーザーの入力値を取得し、数字へ変換する
memo_type = gets.to_i

if memo_type == 1
    puts "ファイル名を入力してください"
    file_name = gets.chomp

    # ファイル名にcsvがついていなければ拡張子をつける
    unless file_name.end_with?(".csv") 
        file_name = file_name + ".csv"
    end

    puts "内容を入力してください"
    puts "保存する場合はCtrl+Zを押してください"

    # 内容を保存する配列を作る
    lines = []

    # 条件が偽になるまで繰り返す(Ctrl+Zのとき、getsはnil=偽になるためループが終了する)
    while line = gets
        lines << line.chomp
    end

    content = lines.join("\n")
    CSV.open(file_name, "a") do |csv|
        lines.each do |line|
            csv << [line]
        end
    end
    puts "保存しました"

elsif memo_type == 2


    puts "ファイル名を入力してください"
    file_name = gets.chomp
    # ファイル名にcsvがついていなければ拡張子をつける
    unless file_name.end_with?(".csv") 
        file_name = file_name + ".csv"
    end

            
    puts "1 → 上書き / 2 → 追記"
    mode = gets.to_i

    # 上書きの場合
    if mode == 1 
        memos = CSV.read(file_name)

        # 配列の要素に番号を付け、表示する
        memos.each_with_index do |memo, index|
            puts "#{index + 1}: #{memo[0]}"
        end

        puts "編集する番号を選んでください"
        edit_index = gets.to_i - 1

        puts "内容を入力してください"
        puts "保存する場合はCtrl+Zを押してください"

        # 内容を保存する配列を作る
        lines = []

        # 条件が偽になるまで繰り返す(Ctrl+Dのとき、getsはnil=偽になるためループが終了する)
        while line = gets
            lines << line.chomp
        end

        new_content = lines.join("\n")

        # 選んだ列の0番目の行を書き換える
        memos[edit_index][0] = new_content

        CSV.open(file_name, "w") do |csv|
            # memosの中身を1つずつ取り出して上書きする
            memos.each do |memo|
                csv << memo
            end
        end
        puts "保存しました"

    # 追記の場合
    elsif mode == 2
        
        puts "内容を入力してください"
        puts "保存する場合はCtrl+Zを押してください"

        # 内容を保存する配列を作る
        lines = []

        # 条件が偽になるまで繰り返す(Ctrl+Dのとき、getsはnil=偽になるためループが終了する)
        while line = gets
            lines << line.chomp
        end

        content = lines.join("\n")
        CSV.open(file_name, "a") do |csv|
            lines.each do |line|
                csv << [line]
            end
         end
        puts "保存しました"
    end
else
    puts "1か2を入力してください"
end