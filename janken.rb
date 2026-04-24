loop do

    puts "じゃんけん..."
    puts "0(グー)　1(チョキ)　2(パー)"

    player_janken = gets.to_i
    program_janken = Random.rand(3)

    if player_janken > 2 || player_janken < 0
        puts "0～2の数字を入力してください"
        next
    end

    jankens = ["グー", "チョキ", "パー"]

    puts "あなた：#{jankens[player_janken]}"
    puts "相手：#{jankens[program_janken]}"
    puts "------------------"

    # あいこの場合
    if player_janken == program_janken
        puts "あいこです"
        next

    # playerがじゃんけんに勝った場合
    elsif (player_janken == 0 && program_janken == 1) || (player_janken == 1 && program_janken == 2) || (player_janken == 2 && program_janken == 0)
        puts "あっちむいて..."
        puts "0(上)　1(下)　2(左)　3(右)"

        player_attimuitehoi = gets.to_i
        program_attimuitehoi = Random.rand(4)

        if player_attimuitehoi > 3 || player_attimuitehoi < 0
            puts "0～3の数字を入力してください"
            next
        end

        attimuitehois = ["上", "下", "左", "右"]

        puts "あなた：#{attimuitehois[player_attimuitehoi]}"
        puts "相手：#{attimuitehois[program_attimuitehoi]}"
        puts "------------------"


        if player_attimuitehoi == program_attimuitehoi
            puts "あなたの勝ち"
            break
        end

    # programがじゃんけんに勝った場合
    elsif (player_janken == 0 && program_janken == 2) || (player_janken == 1 && program_janken == 0) || (player_janken == 2 && program_janken ==1)
        puts "あっちむいて..."
        puts "0(上)　1(下)　2(左)　3(右)"

        player_attimuitehoi = gets.to_i

        program_attimuitehoi = Random.rand(4)

        if player_attimuitehoi > 3 || player_attimuitehoi < 0
            puts "0～3の数字を入力してください"
            next
        end

        attimuitehois = ["上", "下", "左", "右"]

        puts "あなた：#{attimuitehois[player_attimuitehoi]}"
        puts "相手：#{attimuitehois[program_attimuitehoi]}"
        puts "------------------"

        if player_attimuitehoi == program_attimuitehoi
            puts "あなたの負け"
            break
        end
        
    end
end