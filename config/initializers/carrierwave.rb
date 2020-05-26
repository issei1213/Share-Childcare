require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
    config.storage = :file
  else #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: 'ap-northeast-1'
    }
  end

  config.fog_directory  = 'share-childcare'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/share-childcare'
  config.fog_attributes = {cache_control: 'max-age=31536000', expires: 1.year.from_now.httpdate}
  config.fog_public = true
  config.asset_host = 'http://static.aws-and-infra.online/'
  
end