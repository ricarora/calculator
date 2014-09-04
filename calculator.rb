include Math

# calculate the answer using a math function
def calculate(f, a, b)
  if f == "addition" || f == "+"
    add(a, b)
  elsif f == "subtraction" || f == "-"
    subtract(a, b)
  elsif ["multiplication", "*"].include?(f)
    multiply(a, b)
  elsif ["division", "/"].include?(f)
    divide(a, b)
  elsif ["exponent", "^"].include?(f)
    exponent(a, b)
  elsif ["square root", "sqrt"].include?(f)
    sqrroot(a)
  else
    nil
  end
end

# Add the two numbers
def add(a, b)
  a + b
end

# Subtract the two numbers
def subtract(a, b)
  a - b
end

# Multiply two numbers
def multiply(a, b)
  a * b
end

# Divide two numbers
def divide(a, b)
  a / b
end

# calculate exponent
def exponent(a, b)
  a ** b
end

# calculate square root of a number
def sqrroot(a)
  Math.sqrt(a)
end

# Quit early if the action is not within our parameters
def scope_check(p)
  if ["addition", "+", "subtraction", "-", "multiplication", "*", "division", "/", "exponent", "^", "square root", "sqrt"].include?(p) == false
    puts "This function is out of scope!"
    exit
  end
end

# get number and check if it is not a string
def get_num(prompt)
  puts "What is the #{prompt} number?"
  raw_num1 = gets.chomp

  while raw_num1 != 0 && raw_num1.to_f == 0
    puts "What is the #{prompt} number? Please do not enter a word."
    raw_num1 = gets.chomp
  end
  raw_num1.to_f
end

puts "Hello there!"
puts "What kind of maths would you like to do?"
input = gets.chomp
scope_check(input)

num1 = get_num("first")

if ["square root", "sqrt"].include?(input)
  num2 = 0
else
  num2 = get_num("second")
end

# calculate answer for the given inputs
answer = calculate(input, num1, num2)

puts "Wow, your answer is #{answer.to_f.round(3)}. That's a big number."

# Checks next step to do complex equations
puts "Do you want to continue calculating complex equations? (y or n)"
cont_input = gets.chomp

# computes complex equation
while cont_input == "y"
  puts "What kind of maths would you like to do next?"
  input = gets.chomp
  scope_check(input)
  puts "num1 = #{answer}"

  if ["square root", "sqrt"].include?(input)
    num2 = 0
  else
    num2 = get_num("second")
  end

# calculates answer for complex equation
  answer = calculate(input, answer, num2)

  puts "Wow, your answer is #{answer.to_f.round(3)}. That's a big number."
  puts "Do you want to continue calculating complex equations? (y or n)"
  cont_input = gets.chomp
end
