class Stack

  attr_accessor :stack

  def initialize(stack = [])
    @stack = stack
  end

  def add(el)
    stack << el
  end

  def remove
    stack.pop
  end

  def show
    stack
  end
end

class Queue

  attr_accessor :queue

  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(el)
    queue << el
  end

  def dequeue
    queue.shift
  end

end


class Map

  attr_accessor :map

  def initialize(map = [])
    @map = map
  end

  def assign(key, val)

    map.each_index do |idx|
      return map[idx] = [key, val] if map[idx].first == key
    end
    map << [key, val]
  end

  def lookup(key)
    map.each do |el|
      return el if el[0] == key
    end
    false
  end

  def remove(key)
    map.length.times do |idx|
      if map[idx].first == key
        map.delete(map[idx])
        return true
      end
    end
    "key doesn't exist"
  end


  def show
    map
  end
end
