# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("default.png")
  end

  process :resize_to_fit => [960, 960]

  version :thumb do
    process :resize_to_fit => [150, 150]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

end
