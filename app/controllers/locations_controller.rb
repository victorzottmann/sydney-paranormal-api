class LocationsController < ApplicationController
  def index
    @locations = Location.all
    render json: @locations
  end

  def show
    @location = Location.find(params[:id])
    render json: {
      features: [
        { 
          type: "Feature", 
          properties: {
            title: @location.title, 
            description: @location.description,
            street: @location.street,
            suburb: @location.suburb,
            state: @location.state,
            country: @location.country
          },
          geometry: {
            coordinates: [
              @location.longitude,
              @location.latitude
            ]
          },
          type: "Point"
        }
      ],
      type: "FeatureCollection"
    }
  end

  def create
    @location = Location.new(location_params)
    puts "===== IN CREATE ACTION ====="
    p @location

    if @location.save
      render json: @location, status: :created
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:title, :description, :street, :suburb, :state, :country)
    end
end