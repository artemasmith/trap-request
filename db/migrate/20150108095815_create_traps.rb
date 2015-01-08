class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|
      t.string :name
      t.text :raw_data
      t.string :remote_ip
      t.string :request_method
      t.string :scheme
      t.string :query_string
      t.string :query_params
      t.string :headers
      t.string :cookies
      t.string :authorization

      t.timestamps null: false
    end
  end
end
