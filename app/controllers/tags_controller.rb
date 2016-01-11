class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
  end
  
  before_filter :require_login, only: [:destroy]
  
  def destroy
    @tag = Tag.find(params[:id])
	flash.notice = "Tag '#{@tag.name}' deleted!"
	@tag.delete
	
	redirect_to action: "index"
  end
end
