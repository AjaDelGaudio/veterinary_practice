class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :school_recieved_degree_from
      t.integer :years_in_practice

      t.timestamps null: false
    end
  end
end
