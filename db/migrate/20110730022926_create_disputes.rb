class CreateDisputes < ActiveRecord::Migration
  def self.up
    create_table :disputes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :disputes
  end
end
