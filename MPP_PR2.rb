def priority(operator)
  case operator
  when '+', '-'
    return 1
  when '×', '/'
    return 2
  when '^'
    return 3
  else
    return 0
  end
end

def infixToRPN(expression)
  output = []
  stack = []

  operators = '+-×/^'

  expression.each_char do |char|
    if char.match?(/\d/) || char == '!'
      output << char
    elsif operators.include?(char)
      while !stack.empty? && priority(stack.last) >= priority(char)
        output << stack.pop
      end
      stack << char
    elsif char == '('
      stack << char
    elsif char == ')'
      while !stack.empty? && stack.last != '('
        output << stack.pop
      end
      if stack.last == '('
        stack.pop
      else
        return "Wrong input"
      end
    end
  end

  while !stack.empty?
    if stack.last == '('
      return "Wrong input"
    end
    output << stack.pop
  end

  return output.join
end

inputExpression = ARGV.join(" ")
rpnExpression = infixToRPN(inputExpression)
puts "Infix expression: #{inputExpression}"
puts "RPN expression: #{rpnExpression}"

