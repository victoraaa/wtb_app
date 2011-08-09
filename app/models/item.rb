class Item < ActiveRecord::Base
  belongs_to :dispute
  
  validates :dispute_id, :presence => true
  
  #paperclip
  if ENV["RAILS_ENV"]=='production'
    
  has_attached_file :image, :styles => {:mini => "300X300>" },

  #Para fazer upload na web
  :storage => :s3,
	:bucket => 'wtb_app',
  :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
  }

  else

  has_attached_file :image
  
  end
	
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 1.megabytes
  validates_attachment_content_type :image, 
    :content_type => ['image/jpeg', 'image/png', 'image/jpg']

end
