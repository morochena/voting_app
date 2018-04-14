if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJJDV5FVA3NQ32S2Q'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end