# An animal shelter, which holds only dogs and cats, operates on a strictly "first in, first out" basis. People must adopt either the "oldest" (based on arrival time) of all animals at the shelter, or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of that type). They cannot select which specific animal they would like. Create the data structures to maintain this system and implement operations such as enqueue, dequeue_any, dequeue_dog, and dequeue_cat.

class AnimalShelter
  def initialize
    @shelter = Queue.new
  end

  def dequeue_any
    @shelter.dequeue
  end

  def dequeue_dog
    @shelter.dequeue("dog")
  end

  def dequeue_cat
    @shelter.dequeue("cat")
  end
end

class Queue
  def initialize
    @first = nil
    @last = nil
  end

  def enqueue(node)
    if !@last.nil?
      @last.next = node
    end
    @last = node

    if @first.nil?
      @first = @last
    end
  end

  def dequeue(type = nil)
    if @first.nil?
      raise "Empty queue"
    end

    if type.nil? || @first.type == type
      name = @first.name
      @first = @first.next
      if @first.nil?
        @last = nil
      end
      return name
    else
      curr = @first

      while @first.next.type != type && !@first.next.nil?
        curr = curr.next
      end

      if curr.next.nil?
        raise "No animal of this type"
      else
        name = curr.next.name
        if curr.next.next
          curr.next = curr.next.next
          return name
        else
          curr.next = nil
          @last = curr
          return name
        end
      end
    end
  end
end

class QueueNode
  def initialize(type, name)
    @type = type
    @name = name
    @next = null
  end
end

########################
class Animal
  attr_accessor :order

  def initialize(name)
    @name = name
    @order = nil
  end
end

class Cat < Animal
  def initialize(name)
    super
  end
end

class Dog < Animal
  def initialize(name)
    super
  end
end

class Queue
  attr_accessor :first, :last

  def initialize
    @first = nil
    @last = nil
  end

  def enqueue(node)
    if !@last.nil?
      @last.next = node
    end
    @last = node

    if @first.nil?
      @first = @last
    end

    node
  end

  def dequeue
    if @first.nil?
      raise "Empty"
    end
    @first = @first.next
    if @first.nil?
      @last = nil
    end

    @first
  end

  def peek
    @first
  end

  def empty?
    @first.nil?
  end
end

class AnimalQueue
  def initialize
    @cats = Queue.new
    @dogs = Queue.new
    @order = 0
  end

  def enqueue(animal)
    animal.order = @order
    @order += 1
    if animal.is_a?(Cat)
      @cats.enqueue(animal)
    else
      @dogs.enqueue(animal)
    end
    animal.name
  end

  def dequeue_any
    cat = @cats.peek
    dog = @dogs.peek

    if cat.nil?
      return @dogs.dequeue
    elsif dog.nil?
      return @cats.dequeue
    end

    if cat.order < dog.order
      @cats.dequeue
    else
      @dogs.dequeue
    end
  end

  def dequeue_cat
    @cats.dequeue
  end

  def dequeue_dog
    @dogs.dequeue
  end
end
