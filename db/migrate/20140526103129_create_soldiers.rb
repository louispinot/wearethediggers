class CreateSoldiers < ActiveRecord::Migration
  def change
    create_table :soldiers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :service_number
      t.string :rank
      t.string :unit
      t.string :date_of_death
      t.string :place_of_death
      t.string :cemetery
      t.string :source
      t.text :bio

      t.timestamps
    end
  end
end
