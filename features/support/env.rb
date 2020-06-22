require 'rspec'
require 'page-object'
require 'data_magic'
require 'faker'
require 'allure-cucumber'

World(PageObject::PageFactory)


AllureCucumber.configure do |config|
  config.results_directory = 'report/allure'
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end
