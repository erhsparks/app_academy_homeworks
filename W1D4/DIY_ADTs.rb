class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end


class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    found_key = false

    @map.map! do |pair|
      if pair[0] == key
        found_key = true

        [pair[0], value]
      else
        pair
      end
    end
    @map << [key, value] unless found_key

    [key, value]
  end

  def lookup(key)
    @map.select { |pair| return pair[1] if pair[0] == key }

    nil
  end

  def remove(key)
    found_key = nil

    @map.delete_if do |pair|
      found_key = pair if pair[0] == key
      
      pair[0] == key
    end

    found_key
  end

  def show
    @map
  end
end
