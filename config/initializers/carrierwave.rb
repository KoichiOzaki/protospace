CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: Settings.dev_carrierwave_fog[:provider],
    aws_access_key_id: Settings.dev_carrierwave_fog[:aws_access_key_id],
    aws_secret_access_key: Settings.dev_carrierwave_fog[:aws_secret_access_key],
    region: Settings.dev_carrierwave_fog[:region]
  }

  case Rails.env
    when 'development'
      config.fog_directory = Settings.dev_carrierwave_fog[:fog_directory]
      config.asset_host = Settings.dev_carrierwave_fog[:asset_host]
  end
end
