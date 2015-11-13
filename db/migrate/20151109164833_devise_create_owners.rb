class DeviseCreateOwners < ActiveRecord::Migration
  def change
    create_table(:owners) do |t|
      t.string :name

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.timestamps null: false
    end

    add_index :owners, :email,                unique: true
  end
end
