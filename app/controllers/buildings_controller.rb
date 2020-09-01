class BuildingsController < ApplicationController
    before_action :find_building, only: [:show, :update, :edit]

    def index
        @buildings = Building.all
    end
    
    def show
    end

    def edit
    end

    def update
        if @building.update(building_params)
            redirect_to building_path(@building)
        else
            flash[:my_errors] = @building.errors.full_messages
            redirect_to edit_building_path
        end
    end

    private

    def building_params
        params.require(:building).permit(:name, :country, :address, :rent_per_floor)
    end

    def find_building
        @building = Building.find(params[:id])
    end

end