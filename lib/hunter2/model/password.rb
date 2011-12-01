module Hunter2
  module Model
    class Password < Sequel::Model
      plugin :timestamps, :created => :created_at

      def self.create_or_update(params)
        row = Password[params]

        if row.nil?
          return create(params)
        else
          return row.update(params)
        end
      end

      def validate
        validates_unique(:key)
      end
    end
  end
end
