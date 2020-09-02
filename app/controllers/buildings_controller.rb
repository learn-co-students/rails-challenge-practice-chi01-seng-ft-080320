class BuildingsController < ApplicationController
    def index 
        @buildings = Building.all
    end

    def show
        @building = Building.find(params[:id])
    end

    def edit 
        @building = Building.find(params[:id])
    end

    def update
        @building = Building.find(params[:id])
        if @building.update(building_params(:name, :country, :address, :rent_per_floor, :number_of_floors))
            redirect_to building_path(@building)
        else 
            flash[:errors] = @building.errors.full_messages
            redirect_to edit_building_path(@building)
        end
        byebug
    end

    private
    
    def building_params(*args)
        params.require(:building).permit(*args)
    end
end

