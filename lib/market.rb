class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end
# how do I add a vendor by grabbing the instance object that calls
# a method from a differnet class?
  
end
