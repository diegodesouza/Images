# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  version :default

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  include CarrierWave::MiniMagick
  # version :large_avatar do
  #   # returns a 150x150 image
  #   process :resize_to_fill => [150, 150]
  # end
  # version :medium_avatar do
  #   # returns a 50x50 image
  #   process :resize_to_fill => [50, 50]
  # end
  # version :small_avatar do
  #   # returns a 35x35 image
  #   process :resize_to_fill => [35, 35]
  # end

  process :resize_to_fit => [800, 800]

  version :thumb do
    process :resize_to_fill => [150, 150]
  end

end
