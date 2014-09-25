class Attachment < ActiveRecord::Base
  attr_accessible :attachable_id, :file, :title
  
  belongs_to :attachable, polymorphic: true
  
  # Mounts the file uploader to this model.
  mount_uploader :file, FileUploader
  
  validates_length_of :title, maximum: 500
end
