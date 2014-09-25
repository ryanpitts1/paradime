class Listing < ActiveRecord::Base
  attr_accessible :user_id, :title, :price, :city, :state, :show_email, :email, :show_phones, :primary_phone, :secondary_phone, :description, :listing_owner, :ip_at_creation, :ip_at_modification, :attachments_attributes

  geocoded_by :location
  
  before_validation :format_phones
  after_validation :geocode, :if =>  lambda { |l| l.city_changed? || l.state_changed? }

  UNRANSACKABLE_ATTRIBUTES = ["id", "show_email", "email", "show_phones", "primary_phone", "secondary_phone", "listing_owner", "ip_at_creation", "ip_at_modification", "updated_at", "user_id"]
  
  belongs_to :user
  has_many :attachments, :as => :attachable, dependent: :destroy
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  
  validates_presence_of :title, :price, :city, :state, :description, :listing_owner
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates_length_of :title, maximum: 500
  validates_length_of :city, maximum: 250
  validates_length_of :email, :primary_phone, :secondary_phone, :listing_owner, maximum: 250
  validates_length_of :description, maximum: 9000
  
  def format_phones
    primary_phone = self.primary_phone.gsub(/\D/,'')
    secondary_phone = self.secondary_phone.gsub(/\D/,'')
  end
  
  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
  
  def location
  	[city, state].join(', ')
  end
end