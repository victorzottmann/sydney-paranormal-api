class CommentsController < ApplicationController

    def index

        @comments = Comment.where(note_id: comment_params[:note_id])
        render json: @comments

    end

    def create

        @comment = Note.create(new_params)

        if @comment.errors.any?
            render json: @comment.errors, status: :unprocessable_entity
        else
            render json: @comment, status: 201
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
        params.require(:pin).permit(:description, :date, :note_id)
    end

end