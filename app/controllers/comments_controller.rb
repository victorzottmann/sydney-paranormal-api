class CommentsController < ApplicationController

  def index
    @comments = Comment.where(note_id: comment_params[:note_id])
    render json: @comments
  end

  def create
    if comment_params[:user_id] == decoded_token[0]["user_id"]
        @comment = Comment.create(comment_params)
        if @comment.errors.any?
          render json: @comment.errors, status: :unprocessable_entity
        else
          render json: @comment, status: 201
        end
    end
  end

  def show

  end

  def update

  end

  def destroy

  end



  private

  def comment_params
      params.require(:comment).permit(:text, :date, :note_id, :user_id)
  end


end