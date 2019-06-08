class CategoriesController < ApplicationController
  def index
    respond_to do |format|
    format.json  { @categories = Category.find(params[:id]).children}
    end
  end
end