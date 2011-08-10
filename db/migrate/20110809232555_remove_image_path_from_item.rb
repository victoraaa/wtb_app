class RemoveImagePathFromItem < ActiveRecord::Migration
  def self.up
    remove_column :itens, :image_path
  end

  def self.down
    add_column :itens, :image_path, :string
  end
end
