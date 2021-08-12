class PinsController < ApplicationController

  def index
    @pins = Pin.all

    @locations = @pins.map{ |location| {
      id: location[:id],
      title: location[:title],
      description: location[:description],
      street: location[:street],
      suburb: location[:suburb],
      state: location[:state],
      country: location[:country],
      latitude: location[:latitude],
      longitude: location[:longitude]
    }}
    
    render json: @locations
  end

  def show
    def show
      @pin = Pin.find(params[:id])
      render json: {
        features: [
          { 
            type: "Feature", 
            properties: {
              title: @pin.title, 
              description: @pin.description,
              street: @pin.street,
              suburb: @pin.suburb,
              state: @pin.state,
              country: @pin.country
            },
            geometry: {
              coordinates: [
                @pin.longitude,
                @pin.latitude
              ]
            },
            type: "Point"
          }
        ],
        type: "FeatureCollection"
      }
    end
  end

  def create

    @pin = Pin.create(pin_params)
    if @pin.errors.any?
      render json: @pin.errors, status: :unprocessable_entity
    else
      render json: @pin, status: 201
    end

    if pin_params[:pin_family_attributes] != nil
      @pin_family = PinFamily.where(pin_id: pin_params[:pin_family_attributes][0][:pin_id])[0]
      if @pin_family == nil
        @pin_family = PinFamily.create(pin_id: pin_params[:pin_family_attributes][0][:pin_id])
      end
    @pin.pin_family_id = @pin_family.id
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:user_id, :title, :description, :street, :suburb, :state, :country, pin_family_attributes: [:pin_id])
    end
end