# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
WtbApp::Application.initialize!

#paperclip
Paperclip.options[:command_path] = "C:/Program Files (x86)/ImageMagick-6.7.1-Q16/"