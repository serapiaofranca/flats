class PropertiesController < ApplicationController
    before_action :authenticate_property_owner!, only: [:new, :create, :edit, :update]

    def show
        @property = Property.find(params[:id])        
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(property_params)
        @property.property_owner = current_property_owner
        if @property.save
            redirect_to @property # por convenção vai redirecionar pro show
        else            
            render :new
        end
    end

    def edit
        @property = Property.find(params[:id])
    end

    def update
        @property = Property.find(params[:id])
        if !@property.update(property_params)
            render :edit
        else @property.update!(property_params) 
            redirect_to @property        
        end
    end

    def my_properties
        @properties = current_property_owner.properties
    end

    private

    def property_params
        params.require(:property).permit(
            :title, :description, :rooms, 
            :bathrooms, :daily_rate, :pets, 
            :parking_slot, :property_type_id, :property_location_id)
    end
end