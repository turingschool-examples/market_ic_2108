class Vendor
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def inventory
    hash = Hash.new
  end
end
