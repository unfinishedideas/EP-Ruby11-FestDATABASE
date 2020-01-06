require 'rspec'
require 'pg'
require 'stage'
require 'artist'
require 'pry'

DB = PG.connect({:dbname => 'fest_db_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stages *;")
    DB.exec("DELETE FROM artists *;")
  end
end
