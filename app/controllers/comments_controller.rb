class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
  
  def set_job
    @job = Job.find(params[:job_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end
  
end