require 'rubygems'
require 'fast-aes'
require 'shebang'
require 'sequel'
require 'base64'

['version', 'command'].each do |file|
  require File.expand_path("../hunter2/#{file}", __FILE__)
end

# Load AES
key = 'YOUR_OWN_SECRET_KEY'
AES = FastAES.new(key)

# Load all the required Sequel extensions/plugins
Sequel.extension(:migration)
Sequel::Model.plugin :validation_helpers, :timestamps

module Hunter2
  class << self
    attr_accessor :database
    attr_accessor :aes

    def init
      # Ensure we're connected to a database
      if @database.nil?
        $stderr.puts('No database connection has been set')
        exit
      end

      # Load all the models after the database connection has been established.
      Dir.glob(
        File.expand_path('../hunter2/model/*.rb', __FILE__)
      ).each do |f|
        require(f)
      end
    end
  end
end
