module Hunter2
  class Command < ::Shebang::Command
    command :default
    banner  'Runs an example command.'
    usage   '$ hunter2 [OPTIONS]'

    o :h, :help    , 'Shows this help message'  , :method => :help
    o :v, :version , 'Shows the current version', :method => :version

    o :k, :key     , 'Key'     , :type => String
    o :p, :password, 'Password', :type => String

    def index

    end

    def add
      if option(:p).nil?
        puts "You need to enter a password."
        exit
      end

      # Encrypt password using FastAES
      encrypted_pass = AES.encrypt(option(:p))

      # Save password and key to database
      password = Hunter2::Model::Password.create_or_update(
        :key      => option(:k),
        :password => encrypted_pass
      )

      puts "Password #{option(:k)} successfully added. Use show -k "+
        "#{option(:k)} to show your password."
    end

    def update
      if option(:p).nil?
        puts "You need to enter a password."
        exit
      end

      # Encrypt password using FastAES
      encrypted_pass = AES.encrypt(option(:p))

      # Update password
      password = Hunter2::Model::Password.filter(:key => option(:k)).limit(1)
      password.update(:password => encrypted_pass)

      puts "Password #{option(:k)} successfully updated."
    end

    def delete
      password = Hunter2::Model::Password.filter(:key => option(:k)).limit(1)
      password.delete

      puts "Password #{option(:k)} successfully deleted."
    end

    def show
      # Get encrypted password for this key
      password = Hunter2::Model::Password.select(:password) \
        .filter(:key => option(:k)) \
        .limit(1) \
        .single_value

      # Decrypt password
      password = AES.decrypt(password)

      puts "Password for #{option(:key)}: #{password}"
    end

    protected

    def version
      puts Hunter2::Version
      exit
    end
  end
end
