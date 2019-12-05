class Favorites
  attr_reader :pets

  def initialize(pets)
    @pets = pets || Array.new
  end

  def add(pet)
    @pets << pet
  end

  def total_count
    @pets.length
  end
end
