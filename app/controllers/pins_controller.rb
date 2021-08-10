class PinsController < ApplicationController

  def index
    @pins = Pin.all
    render json: @pins
  end

  def create


    new_params = {"title": pin_params['title'], "user_id": pin_params['user_id']}

    @pin = Pin.create(new_params)
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


  def show
    puts "AAAAAAAAAAAAAA"

    puts pin_param

    @notes = Note.all
    render json: @notes, status: 202

  end

  def update


  end

  private

  def pin_params
    params.require(:pin).permit(:id, :title, :user_id, :description, pin_family_attributes: [:pin_id])
  end

  def pin_param
    params.permit(:id)
  end

end