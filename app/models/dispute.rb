class Dispute < ActiveRecord::Base
  has_many :itens, :dependent => :destroy
  
  
  validates :name, :presence => true
  validates :itens, :length => {:minimum => 2, :message=>": Sao necessarios pelo menos dois itens"}
  accepts_nested_attributes_for :itens, 
    :reject_if => lambda { |a| a[:name].blank? || a[:image_path].blank? },
    :allow_destroy => true
end
