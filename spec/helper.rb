require File.expand_path('../../lib/hunter2', __FILE__)
require File.expand_path('../../lib/hunter2/spec/helper', __FILE__)

# Configure the database
Hunter2.database = Sequel.connect(
  :adapter   => 'sqlite',
  :database  => 'database.db',
  :test      => true,
  :encoding  => 'utf8'
)

Hunter2.init
