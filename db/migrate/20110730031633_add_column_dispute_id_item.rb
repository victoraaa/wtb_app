class AddColumnDisputeIdItem < ActiveRecord::Migration
  def self.up
    add_column :itens, :dispute_id, :integer
  end

  def self.down
    remove_column :itens, :dispute_id
  end
end
