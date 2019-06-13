class CategoriesController < ApplicationController
  def index
  end

  def new
    respond_to do |format|
    format.json { @categories = Category.find(params[:id]).children}
    end
  end

  def ancestors
    respond_to do |format|
      format.json {@ancestors = Category.find(params[:id]).ancestors}
    end
  end

  def siblings
    respond_to do |format|
      format.json {@siblings = Category.find(params[:id]).siblings}
    end
  end

end