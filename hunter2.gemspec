require File.expand_path('../lib/hunter2/version', __FILE__)

# Get all the files from the manifest
manifest = File.open './MANIFEST', 'r'
manifest = manifest.read.strip
manifest = manifest.split "\n"

Gem::Specification.new do |s|
  s.name        = 'hunter2'
  s.version     = Hunter2::Version
  s.date        = '03-08-2011'
  s.authors     = ['Abdelrahman Mahmoud']
  s.email       = 'abdel@aplusm.me'
  s.summary     = 'Kick-ass CLI-based password manager.'
  s.homepage    = 'https://github.com/abdelm/hunter2'
  s.description = 'A CLI-based password manager in Ruby.'
  s.files       = manifest
  # s.has_rdoc    = 'yard'
  
  s.executables = ['hunter2'] 

  s.add_dependency('sequel'     , ['~> 3.26.0'])
  s.add_dependency('fast-aes'   , ['~> 0.1.1'])
  s.add_dependency('bcrypt-ruby', ['~> 2.1.4'])
  
  s.add_development_dependency('rake'     , ['~> 0.8.7'])
  s.add_development_dependency('rspec'    , ['~> 2.6.0'])
  s.add_development_dependency('yard'     , ['~> 0.7.1'])
  s.add_development_dependency('rdiscount', ['~> 1.6.8'])
end
