class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  def public_id
    return model.category_id
  end  
  # Remove everything else

end