class Building < ApplicationRecord

  has_many :offices
  has_many :companies, through: :offices


  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    # building collection of empty offices to use in collection select form !!!
     number_of_floors_available.map { |f| offices.build(floor: f) }
  end


  def rented_floors
    floors = self.offices.map do |office|
      office.floor
    end
    floors
  end

  def total_floors
    floors_array = [*1..self.number_of_floors]
  end

  def total_rent 
    rented = self.rented_floors
    sum = 0
    rented.each do |floor|
      sum += floor * self.rent_per_floor
    end
    sum
  end

  def available_floors
    rented = self.rented_floors
    floors = self.total_floors
    available = floors - rented
  end

end
