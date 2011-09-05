# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FaceBookAPI::Application.initialize!

config = YAML::load(File.open(File.expand_path( RAILS_ROOT + "/minifb-demo-config.yml")))
FB_API_KEY = config['fb_api_key']
FB_SECRET = config['fb_secret']
FB_APP_ID = config['fb_app_id']
HOST = config['host']