# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	config.gem 'formtastic'
	config.gem 'paperclip'
	config.gem 'awesome_nested_set'
	config.gem 'jrails'
  config.gem 'haml'
  config.gem 'authlogic'
  config.gem 'cancan'
  config.gem 'searchlogic'
	
  config.i18n.default_locale = :en
  config.time_zone = 'UTC'
end
