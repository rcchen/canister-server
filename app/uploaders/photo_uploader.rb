# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  S3_ACCESS_KEY_ID = "S3_ACCESS_KEY_ID"
  S3_ACCESS_KEY_SECRET = "S3_ACCESS_KEY_SECRET"
  S3_BUCKET_NAME = "S3_BUCKET_NAME"
  S3_REGION = "S3_REGION"

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def fog_provider
    'fog/aws'
  end

  def fog_credentials
    {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV[S3_ACCESS_KEY_ID],        # required
      aws_secret_access_key: ENV[S3_ACCESS_KEY_SECRET],    # required
      region:                ENV[S3_REGION]                # optional, defaults to 'us-east-1'
    }
  end

  def fog_directory
    ENV[S3_BUCKET_NAME]
  end
end
