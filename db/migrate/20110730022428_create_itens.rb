class CreateItens < ActiveRecord::Migration
  def self.up
    create_table :itens do |t|
      t.string :name
      t.integer :rating
      t.string :image_path

      t.timestamps
    end
  end

  def self.down
    drop_table :itens
  end
end
