class CreateIdentifications < ActiveRecord::Migration
  def change
    create_table :identifications do |t|
      t.references :soldier, index: true
      t.references :picture, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
