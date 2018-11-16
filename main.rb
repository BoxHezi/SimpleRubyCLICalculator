#!/usr/bin/ruby

#Code execute before the program is run
BEGIN {
    puts "Welcome to the Simple Ruby Command Line Calculator"
    puts ""
}

#Code execute when the program is terminated
END {
    puts ""
    puts "Thanks for using this calculator"
    puts "Existing..."
}

def menu()
    while (true) do
        #Ruby heredoc
        print <<MENU
You can do:
1. Addition
2. Substraction
3. Multiplication
4. Division
Q. Quit
MENU
        userSelection = readSelection
        if (userSelection == nil)
            return
        end
    end
end

def readSelection()
    selection = 0;
    while (true) do
        print "Please enter your selection: "
        selection = gets.chomp

        #convert user input to upper case
        selection = selection.upcase
        if (selection == "Q")
            #return value will be "nil"
            return
        end

        #convert user input to integer
        selection = selection.to_i

        #check if user input is in the specific range
        if (!selection.between?(1, 4))
            puts "Please enter a number from 1 to 4!"
            redo
        else
            first, second = getCalcuateNumber
            result = calculate first, second, selection
            puts ""
            return result
        end
    end
end

def getCalcuateNumber()
    print "Please input the first nubmer: "
    first = gets.chomp
    first = first.to_i
    print "Please input the second number: "
    second = gets.chomp
    second = second.to_i

    #multiple return value
    return first, second
end

def calculate(a, b, indicator)
    result = 0
    if (indicator == 1)
        result = a + b
        puts "The result of addition is: #{result}"
    elsif (indicator == 2)
        result = a - b
        puts "The result of substraction is: #{result}"
    elsif (indicator == 3)
        result = a * b
        puts "The result of multiplication is: #{result}"
    elsif (indicator == 4)
        #convert one value to floating point into to perform division
        result = a.to_f / b
        puts "The result of division is: #{result}"
    end
    return result
end

menu