class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]

    if @comment.save
      redirect_to job_path(@comment.job)
    else
      render "jobs/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end

end
