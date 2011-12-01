Sequel.migration do
  up do
    create_table :passwords do
      primary_key :id

      String :key
      String :password

      Time :created_at
    end
  end

  down do
    drop_table(:passwords)
  end
end
