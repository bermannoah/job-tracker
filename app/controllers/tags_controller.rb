class TagsController < ApplicationController
  before_action :set_tag

  def index
    @tags = Tag.all
  end
  
  def new
    @tag = Tag.new  
    
  def create
    @tag = Tag.new(tag_params)
  end
  
  def show
    @jobs = Job.find(params[:tag_id])
  end
  
  def edit
  end
  
  def update
    @tag.update(tag_params)
    if @tag.save
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end
  
  def destroy
    tag = Tag.find(params[:id])
    tag.delete
    
    redirect_to tags_path
  end
  
  private
  
  def set_tag
    @tag = Tag.find(params[:id])
  end
  
  def tag_params
    params.require(:comment).permit(:name)
  end
  
end