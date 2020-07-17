

class Player
    attr_accessor :p1name, :p2name , :p1symbol , :p2symbol
    def initialize
        @p1name = p1name
        @p2name = p2name
        @p1symbol = p1symbol
        @p2symbol = p2symbol
    end

    def gets_name 
        puts "Welcome Player1 please enter your name:"
            self.p1name = gets.chomp 
                until p1name.length <= 10
                    puts "Your name is to long please choose another one:"
                    self.p1name = gets.chomp
                end
        puts "Okay Player2 now enter your name:"
            self.p2name = gets.chomp
                until p2name != p1name && p2name.length <= 10
                    puts "You choosed the same name as #{p1name}(Player1) or your name is to long, please enter another name:"
                    self.p2name = gets.chomp
                end
        puts "Awesome, #{p1name} and #{p2name}, now I have your names they are amazing btw!"
    end

    def gets_symbol 
        self.p1symbol = "X"
        self.p2symbol = "O"
        puts "Okay now I have your names, #{p1name}, this is your symbol: #{p1symbol}. #{p2name}, this is your symbol: #{p2symbol}!"
    end

    
end

class Board < Player
    WINS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    attr_accessor :arr1, :arr2, :arr3 , :spacer, :drawnum
    def initialize
        @arr1 = [1,2,3]
        @arr2 = [4,5,6]
        @arr3 = [7,8,9]
        @spacer = "-+-+-"
    end

    def grid
        puts arr1.join("|")
        puts spacer
        puts arr2.join("|")
        puts spacer
        puts arr3.join("|")
    end   
    def p1_change_grid(num)
        if arr1.include?(num) || arr2.include?(num) || arr3.include?(num) == true
            arr1.map! {|i| i == num ? "X" : i}
            arr2.map! {|i| i == num ? "X" : i}
            arr3.map! {|i| i == num ? "X" : i}
            puts "X will be placed on position #{num}."
        elsif num == "X" || num == "O"
            puts "Wrong input: \"#{num}\"! Please make sure you use an undeclared field and or a valid input between 1 and 9"
        else
            arr1.include?(num) | arr2.include?(num) | arr3.include?(num) == false
                puts "Wrong input: \"#{num}\"! Please make sure you use an undeclared field and or a valid input between 1 and 9"
        end
    end

    def p2_change_grid(num)
        if arr1.include?(num) || arr2.include?(num) || arr3.include?(num) == true
            arr1.map! {|i| i == num ? "O" : i}
            arr2.map! {|i| i == num ? "O" : i}
            arr3.map! {|i| i == num ? "O" : i}
            puts "O will be placed on position #{num}."
        elsif num == "X" || num == "O"
            puts "Wrong input: \"#{num}\"! Please make sure you use an undeclared field and or a valid input between 1 and 9"
        else
            arr1.include?(num) | arr2.include?(num) | arr3.include?(num) == false
                puts "Wrong input: \"#{num}\"! Please make sure you use an undeclared field and or a valid input between 1 and 9"
        end
    end

    def p1_check_win
        win =       [arr1[0], arr1[1], arr1[2]].all?{|i| i == "X"} ||
                    [arr2[0], arr2[1], arr2[2]].all?{|i| i == "X"} ||
                    [arr3[0], arr3[1], arr3[2]].all?{|i| i == "X"} ||
                    [arr1[0], arr2[0], arr3[0]].all?{|i| i == "X"} ||
                    [arr1[1], arr2[1], arr3[1]].all?{|i| i == "X"} ||
                    [arr1[2], arr2[2], arr3[2]].all?{|i| i == "X"} ||
                    [arr1[0], arr2[1], arr3[2]].all?{|i| i == "X"} ||
                    [arr1[2], arr2[1], arr3[0]].all?{|i| i == "X"} 
    end

    def p2_check_win
        win =       [arr1[0], arr1[1], arr1[2]].all?{|i| i == "O"} ||
                    [arr2[0], arr2[1], arr2[2]].all?{|i| i == "O"} ||
                    [arr3[0], arr3[1], arr3[2]].all?{|i| i == "O"} ||
                    [arr1[0], arr2[0], arr3[0]].all?{|i| i == "O"} ||
                    [arr1[1], arr2[1], arr3[1]].all?{|i| i == "O"} ||
                    [arr1[2], arr2[2], arr3[2]].all?{|i| i == "O"} ||
                    [arr1[0], arr2[1], arr3[2]].all?{|i| i == "O"} ||
                    [arr1[2], arr2[1], arr3[0]].all?{|i| i == "O"} 
end


    

    def draw_number
        drawnum = 1, 2, 3, 4, 5, 6, 7, 8, 9
    end

    def check_draw
      draw = arr1.any?(1..9) ||
             arr2.any?(1..9) ||
             arr3.any?(1..9)
    end

end

class Game < Board
    def game
        puts "Welcome to Tic Tac Toe"
        puts self.gets_name
        puts self.gets_symbol
        puts "Are you familiar with tic tac toe, if so press N. Do you need a quick refresh of tic tac toe rules, if so press Y?"
        puts "Do you want to read the rules? (Y/N)"
        rules_choice = gets.chomp
            if rules_choice == "Y" || rules_choice == "y"
                puts "Tic Tac Toe is played by two players. One Player has X as it's symbol the other one O. The goal is to put all your symbols in one row, column or diagonal on the playgrid. Fields already declared can't be used again. If each field is occupied and no one has a winning combination, the game is a draw."
                puts "Press any key to continue."
                gets.chomp
            elsif rules_choice == "N" || rules_choice =="n"
                puts ""
            else
                until rules_choice == "Y" || rules_choice =="y" || rules_choice =="N" || rules_choice =="n"
                    puts "Please choose a valid input (Y/N)"
                        rules_choice = gets.chomp
                end
            end
        puts self.grid
        until self.p1_check_win == true || self.p2_check_win == true || check_draw == false
            puts "#{p1name} it's your turn:"
            num = gets.chomp.to_i
            puts self.p1_change_grid(num)
            puts self.grid
                if self.p1_check_win == true
                    puts "#{p1name}, you won!"
                elsif self.p2_check_win == true
                    puts "#{p2name}, you won"
                elsif self.check_draw == false
                    puts "It's a draw nobody won!"
                end
            if self.check_draw == false
                next
            end
            if self.p1_check_win == true
                next
            end
            if self.p2_check_win == true 
                next 
            end
            puts "#{p2name} it's your turn:"
            num = gets.chomp.to_i
            puts self.p2_change_grid(num)
            puts self.grid
                if self.p1_check_win == true
                    puts "#{p1name}, you won"
                elsif self.p2_check_win == true
                    puts "#{p2name}, you won!"
                elsif self.check_draw == false
                    puts "It's a draw nobody won!"
                end
        end
    end
end

game1 = Game.new
puts game1.game









