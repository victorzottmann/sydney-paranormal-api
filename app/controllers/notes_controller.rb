class NotesController < ApplicationController

  def index
    @notes = Note.where(pin_id: note_params[:pin_id])
    render json: @notes
  end

  def create

    if note_params[:user_id] == decoded_token[0]["user_id"]
      @note = Note.create(note_params)
      if @note.errors.any?
        render json: @note.errors, status: :unprocessable_entity
      else
        render json: @note, status: 201
      end
    end

  end

  def show
    @note = Note.where(id: params[:id])
    @comments = Comment.where(note_id: params[:id])

    comments = []
    for item in @comments
        comments.push({text:item.text, created_at:(item.created_at.strftime('%I:%M %p UTC, %a %d %b %Y')), user_name:User.find(item.user_id).username, id:item.id})
    end
    data = {note: @note, comments: comments}
    render json: data, status: 201
  end

  def update
    @note = Note.find(params[:id])
    @note.description = note_params[:description]
    @note.save
  end

  def destroy

  end



  private

  def note_params
    params.require(:note).permit(:id, :title, :description, :date, :pin_id, :user_id, :headers)
  end

end

