class RemoveTypeColumnToTPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :type
  end
end
