CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['S3_PUBLISHABLE_KEY'],                        # required unless using use_iam_profile
    aws_secret_access_key: ENV['S3_SECRET_KEY'],                        # required unless using use_iam_profile
    use_iam_profile:       true,                         # optional, defaults to false
    region:                'eu-west-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['S3_BUCKET']                                  # required
end

