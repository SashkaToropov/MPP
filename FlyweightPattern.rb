class Flyweight
  def initialize(shared_state)
    @shared_state = shared_state
  end

  def operation(unique_state)
    s = @shared_state.to_s
    u = unique_state.to_s
    puts "Flyweight: Displaying shared (#{s}) and unique (#{u}) state."
  end
end

class FlyweightFactory
  def initialize(initial_flyweights)
    @flyweights = {}
    initial_flyweights.each do |state|
      @flyweights[get_key(state)] = Flyweight.new(state)
    end
  end

  def get_key(state)
    state.sort.join('_')
  end

  def get_flyweight(shared_state)
    key = get_key(shared_state)

    if !@flyweights.key?(key)
      puts "FlyweightFactory: Can't find a flyweight, creating a new one."
      @flyweights[key] = Flyweight.new(shared_state)
    else
      puts 'FlyweightFactory: Reusing an existing flyweight.'
    end

    @flyweights[key]
  end

  def list_flyweights
    puts "FlyweightFactory: I have #{@flyweights.size} flyweights:"
    print @flyweights.keys.join("\n")
  end
end

def add_device_to_apple_database(factory, serial_number, owner, model, color)
  puts "\n\nClient: Adding a device to the Apple database."
  flyweight = factory.get_flyweight([model, color])
  flyweight.operation([serial_number, owner])
end

factory = FlyweightFactory.new([
                                 %w[iPhone12 red],
                                 %w[iPadAir4 silver],
                                 %w[MacBookPro2021 space_gray],
                                 %w[iMac27 retina],
                                 %w[AppleWatchSeries9 gold]
                               ])

factory.list_flyweights

add_device_to_apple_database(factory, '123456789', 'Mykyta Shevchenko', 'iPhone12', 'red')

add_device_to_apple_database(factory, '987654321', 'Anastasiya Karpovych', 'iPadAir4', 'silver')

add_device_to_apple_database(factory, '135792468', 'Oleksandr Toropov', 'IPhone 15', 'natural titanium')


puts "\n\n"

factory.list_flyweights
