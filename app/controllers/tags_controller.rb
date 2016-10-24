class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end
  
  def new
    @tag = Tag.new()
  end  
    
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end
  
  def show
    @tag = Tag.find(params[:id])
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
    
  def tag_params
    params.require(:tag).permit(:name)
  end
  
end