class Person
  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}."
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object."
  end
end

chris = Instructor.new("Chris")
chris.greeting
chris.teach

christina = Student.new("Christina")
christina.greeting
christina.learn
christina.teach # This won't work because the teach method belongs to the Instructor class. Student cannot access it.
