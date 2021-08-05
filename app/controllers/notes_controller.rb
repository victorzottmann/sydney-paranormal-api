class NotesController < ApplicationController

  def index
    @notes = Note.where(pin_id: note_params[:pin_id])
    render json: @notes
  end

  def create
    @note = Note.create(new_params)

    if @note.errors.any?
      render json: @note.errors, status: :unprocessable_entity
    else
      render json: @note, status: 201
    end
  end

  def show

  end

  def update

  end

  def destroy

  end



  private

  def note_params
    params.require(:pin).permit(:title, :description, :date, :pin_id)
  end

end
