userChoice = ARGV[0]
computerChoices = ["rock", "paper", "scissors"]
computerChoice = computerChoices.sample

puts "Your choice: #{userChoice}"
puts "Computer's choice: #{computerChoice}"

  if (userChoice == "rock" && computerChoice == "scissors") ||
    (userChoice == "paper" && computerChoice == "rock") ||
    (userChoice == "scissors" && computerChoice == "paper")
    puts "You win!"
  elsif userChoice == computerChoice
    puts "Tie!"
  else
    puts "You lose!"
  end

