class AddAttachmentsImageToItem < ActiveRecord::Migration
  def self.up
    add_column :itens, :image_file_name, :string
    add_column :itens, :image_content_type, :string
    add_column :itens, :image_file_size, :integer
    add_column :itens, :image_updated_at, :datetime
  end

  def self.down
    remove_column :itens, :image_updated_at
    remove_column :itens, :image_file_size
    remove_column :itens, :image_content_type
    remove_column :itens, :image_file_name
  end
end
