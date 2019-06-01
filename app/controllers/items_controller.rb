class ItemsController < ApplicationController
  def new
    @item = Item.new
    @image = Image.new

  end

end
