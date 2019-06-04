class Image < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :image, ImageUploader

  def self.create_image_per(item_params)
    item_params[:images_attributes].each do |image|
      new_image = Image.new(image: image)
      new_image.save!
    end
  end

end
