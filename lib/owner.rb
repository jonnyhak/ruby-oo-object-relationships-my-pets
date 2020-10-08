class Owner
  # code goes here
  attr_reader :name, :species
  @@owners = []

  def initialize (name, species = "human")
    @name = name
    @species = species
    @@owners << self
  end
  
  def say_species
    "I am a human."
  end 
  
  def cats 
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    cats.concat(dogs).each do |pet| 
      pet.mood = "nervous"
      pet.owner = nil
    end 
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 

  def self.all
    @@owners
  end 

  def self.count
    @@owners.count
  end 

  def self.reset_all
    @@owners = []
  end 

end