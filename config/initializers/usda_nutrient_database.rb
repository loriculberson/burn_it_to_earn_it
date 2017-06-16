require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('postgresql')

UsdaNutrientDatabase.configure do |config|
  config.batch_size = 5000 # import batch size, if using activerecord-import
  config.perform_logging = true # default false
  config.logger = Rails.logger # default Logger.new(STDOUT)
  config.usda_version = 'sr28' # default sr28
end

