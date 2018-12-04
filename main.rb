#!/usr/bin/ruby

# Code execute before the program is run
BEGIN {
    puts 'Welcome to the Simple Ruby Command Line Calculator'
    puts ''
}

# Code execute when the program is terminated
END {
    puts ''
    puts 'Thanks for using this calculator'
    puts 'Existing...'
}

def menu
  loop do
    # Ruby heredoc
    print <<MENU
You can do:
1. Addition
2. Substraction
3. Multiplication
4. Division
Q. Quit
MENU
    user_selection = read_selection
    return if user_selection.nil?
  end
end

def read_selection
  loop do
    print 'Please enter your selection: '
    selection = gets.chomp

    # convert user input to upper case
    selection = selection.upcase
    if selection == 'Q'
      # return value will be "nil"
      return
    end

    # convert user input to integer
    selection = selection.to_i

    # check if user input is in the specific range
    if !selection.between?(1, 4)
      puts 'Please enter a number from 1 to 4!'
      redo
    else
      first, second = obtain_cal_num
      result = calculate first, second, selection
      puts ''
      return result
    end
  end
end

def obtain_cal_num
  print 'Please input the first nubmer: '
  first = gets.chomp
  first = first.to_i
  print 'Please input the second number: '
  second = gets.chomp
  second = second.to_i

  # multiple return value
  [first, second]
end

def calculate(first, second, indicator)
  require './calculator'
  cal = Calculator.new

  result = 0
  if indicator == 1
    result = cal.addition(first, second)
    puts "The sum of #{first} and #{second} is: #{result}"
  elsif indicator == 2
    result = cal.subtraction(first, second)
    puts "The substraction of #{first} and #{second} is: #{result}"
  elsif indicator == 3
    result = cal.multiplication(first, second)
    puts "The multiplication #{first} and #{second} is: #{result}"
  elsif indicator == 4
    # convert one value to floating point into to perform division
    result = cal.division(first, second)
    puts "The division #{first} and #{second} is: #{result}"
  end
  result
end

menu
