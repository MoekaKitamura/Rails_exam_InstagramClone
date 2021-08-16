class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  process :resize_to_fill => [320, 320]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #デフォルト画像の設定
  def default_url(*args)
    "default.png"
  end
end
