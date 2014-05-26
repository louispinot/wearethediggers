class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_url
      t.string :ref
      t.string :type
      t.string :author
      t.string :place
      t.string :copyrights_owner
      t.text :description
      t.string :date

      t.timestamps
    end
  end
end
