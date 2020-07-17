
def p2_check_win
    win =   arr1[0] && arr1[1] && arr1[2] == "O"||
            arr2[0] && arr2[1] && arr2[2] == "O"||
            arr3[0] && arr3[1] && arr3[2] == "O"||
            arr1[0] && arr2[0] && arr3[0] == "O"||
            arr1[1] && arr2[1] && arr3[1] == "O"||
            arr1[2] && arr2[2] && arr3[2] == "O"||
            arr1[0] && arr2[1] && arr3[2] == "O"||
            arr1[2] && arr2[1] && arr3[0] == "O"
end


