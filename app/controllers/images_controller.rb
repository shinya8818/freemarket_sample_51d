class ImagesController < ApplicationController
  def index
  end

  def create
    @image = Image.new(image: params[:file])
    if @image.save
      render json: {message: "success", fileID: @image.id}, :status => 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, :status => 400
    end
  end

end
