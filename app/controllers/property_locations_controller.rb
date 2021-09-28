class PropertyLocationsController < ApplicationController
    def show
        @property_locations = PropertyLocation.all    
    end

    def new
        @property_location = PropertyLocation.new
    end

    def create
        @property_location = PropertyLocation.new(property_location_params)
        if @property_location.save
            redirect_to @property_location # por convenção vai redirecionar pro show
        else            
            render :new
        end
    end

    private

    def property_location_params
        params.require(:property_location).permit(:location)
    end

end
