class Photo < ActiveRecord::Base
   has_attachment  :content_type => :image, 
                  :storage => :file_system,
                  :path_prefix => 'public/system', 
                  :max_size => 500.kilobytes, 
                  :resize_to => '600>', 
                  :thumbnails => { :thumb => '125x125!>' } 
                  
  validates_as_attachment 
  
  cattr_reader :per_page
  @@per_page = 10
  
end
