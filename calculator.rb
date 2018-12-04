#!/usr/bin/ruby

# Calculator class
class Calculator

  def initialize; end

  def addition(num1, num2)
    num1 + num2
  end

  def subtraction(num1, num2)
    num1 - num2
  end

  def multiplication(num1, num2)
    num1 * num2
  end

  def division(num1, num2)
    num1.to_f / num2
  end
end