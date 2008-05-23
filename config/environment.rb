APPLICATION_VERSION = '0.9.3 (beta)'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  # Require libraries
  require 'open-uri'
  require 'yaml'
  
  # Invoke Rails 2.1 Timezone functionality 
  config.time_zone = 'UTC'
    
  # The session_key and secret (for verifying session data integrity) can be set in config/database.yml
  db = YAML.load_file('config/database.yml')
  config.action_controller.session = {
    :session_key => db[RAILS_ENV]['session_key'],
    :secret      => db[RAILS_ENV]['secret']
  }
  
end
