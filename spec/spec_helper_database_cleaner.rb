# encoding: UTF-8

# require 'spork'
# 
# Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'database_cleaner'
  require 'factory_girl_rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = false

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.infer_base_class_for_anonymous_controllers = false
    config.include FactoryGirl::Syntax::Methods

    Capybara.javascript_driver = :webkit

    # Rails.logger.level = 4 # speed - http://blog.plataformatec.com.br/tag/capybara/

    config.before :each do
       if Capybara.current_driver == :rack_test
         DatabaseCleaner.strategy = :transaction
       else
         DatabaseCleaner.strategy = :truncation
       end
       DatabaseCleaner.start
     end
    
    config.after do
      DatabaseCleaner.clean
    end
  end
# end

# Spork.each_run do


  # Forces all threads to share the same connection, works on Capybara because it starts the web server in a thread.
  # See http://blog.plataformatec.com.br/tag/capybara/
  # class ActiveRecord::Base
  #   mattr_accessor :shared_connection
  #   @@shared_connection = nil
  # 
  #   def self.connection
  #     @@shared_connection || retrieve_connection
  #   end
  # end
  # 
  # ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
# end
