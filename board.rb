class Board
    #[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]
    attr_accessor :arr1, :arr2, :arr3 , :spacer
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
    def change_grid(num)
        if arr1.include?(num) | arr2.include?(num) | arr3.include?(num) == true
            arr1.map! {|i| i == num ? "X": i}
            arr2.map! {|i| i == num ? "X": i}
            arr3.map! {|i| i == num ? "X": i}
        elsif num == "X" || "O"
            puts "Wrong input: \"#{num}\"! Please make sure you use an undeclared field and or a valid input between 1 and 9"
        else
            arr1.include?(num) | arr2.include?(num) | arr3.include?(num) == false
                puts "Wrong input: \"#{num}\"! Please make sure you use an undeclared field and or a valid input between 1 and 9"
        end
    end

    #def check_win 
    #    case 
    #    when arr1[0] && arr1[1] && arr1[2] == "X"
    #        win = true
    #    when arr2[0] && arr2[1] && arr2[2] == "X"
    #        win = true
    #    when arr3[0] && arr3[1] && arr3[2] == "X"
    #        win = true
    #    when arr1[0] && arr2[0] && arr3[0] == "X"
    #        win = true
    #    when arr1[1] && arr2[1] && arr3[1] == "X"
    #        win = true
    #    when arr1[2] && arr2[2] && arr3[2] == "X"
    #        win = true
    #    when arr1[0] && arr2[1] && arr3[2] == "X"
    #        win = true
    #    when arr1[2] && arr2[1] && arr3[0] == "X"
    #        win = true
    #    end
    #    if win = true 
    #        puts "Congratulations, you've won!"
    #    end
    #end
#end
def check_win 
    win =   arr1[0] && arr1[1] && arr1[2] == "X"||
            arr2[0] && arr2[1] && arr2[2] == "X"||
            arr3[0] && arr3[1] && arr3[2] == "X"||
            arr1[0] && arr2[0] && arr3[0] == "X"||
            arr1[1] && arr2[1] && arr3[1] == "X"||
            arr1[2] && arr2[2] && arr3[2] == "X"||
            arr1[0] && arr2[1] && arr3[2] == "X"||
            arr1[2] && arr2[1] && arr3[0] == "X"

    unless win == false
        puts "You've won!"
    end
    end
end

hello = Board.new 
puts hello.grid
puts hello.change_grid(1)
puts hello.change_grid(2)
puts hello.change_grid(5)
puts hello.grid
puts hello.check_win
puts hello.grid
puts hello.change_grid(8)
puts hello.grid
puts hello.check_win



