class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees
    accepts_nested_attributes_for :offices

    def offices_attributes=(office_attributes)
        office_attributes.each do |key, value|
         building = value["id"].to_i
         floor_arr = value["offices"]
         floor_arr = floor_arr.reject(&:blank?)
         
         floor_arr.each do |floor|
            office = Office.create(building_id: building, floor: floor )
            self.offices << office
         end
        end
    end


    def buildings_and_offices
        building_and_office = {}
        buildings = self.buildings.uniq
        offices = self.offices
        buildings.each do |building|
            offices_arr = []
            offices.each do |office|
                if( building.id == office.building_id)
                    offices_arr << office.floor
                end
                building_and_office[building.name] = offices_arr
            end
        end
        building_and_office
    end

   def total_rent
        building_office = self.buildings_and_offices
        total = 0
        building_office.each do |key, value|
            building = Building.find_by(name: key)
            value.each do |floor|
                total += building.rent_per_floor 
            end
        end
        total
   end


    
    
end
