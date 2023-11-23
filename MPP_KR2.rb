mutex = Mutex.new
condition_variable = ConditionVariable.new

# Функція для виведення чисел потоком
def print_numbers(start, finish, mutex, condition_variable)
  (start..finish).each do |num|
    mutex.synchronize do
      # Очікуємо, якщо інший потік ще не вивів число
      condition_variable.wait(mutex) while !@my_turn

      puts num

      # Передаємо чергування наступному потоку
      @my_turn = !@my_turn
      condition_variable.signal
    end
  end
end

# Запускаємо перший потік
Thread.new do
  @my_turn = true
  print_numbers(1, 10, mutex, condition_variable)
end

# Запускаємо другий потік
Thread.new do
  @my_turn = false
  print_numbers(1, 10, mutex, condition_variable)
end

# Очікуємо завершення обох потоків
Thread.list.each(&:join)