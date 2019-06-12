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

  def shiblings
    respond_to do |format|
      format.json {@shiblings = Category.find(params[:id]).shiblings}
    end
  end

end