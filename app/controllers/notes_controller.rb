class NotesController < ApplicationController

  def index
    @notes = Note.where(pin_id: note_params[:pin_id])
    render json: @notes
  end

  def create
    puts "CREATE"
    puts note_params
    puts params
    @note = Note.create(note_params)

    if @note.errors.any?
      render json: @note.errors, status: :unprocessable_entity
    else
      render json: @note, status: 201
    end
  end

  def show
    @note = Note.where(id: params[:id])
    @comments = Comment.where(note_id: params[:id])

    comments = []
    for item in @comments
        comments.push({text:item.text, created_at:item.created_at, user_name:User.find(item.user_id).username})
    end
    data = {note: @note, comments: comments}
    render json: data, status: 201
  end

  def update
    puts params[:id]
    @note = Note.find(params[:id])
    @note.description = note_params[:description]
    @note.save
    puts note_params[:description]
    puts @note.title
  end

  def destroy

  end



  private

  def note_params
    params.require(:note).permit(:id, :title, :description, :date, :pin_id, :user_id, :headers)
  end

end

