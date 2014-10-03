class Pic < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :big => "900x900>", :large => "600x600>", :medium => "400x400>", :thumb => "100x100>" }

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates :image, presence: true
  validates :tag, presence: true
	
	acts_as_taggable
	acts_as_taggable_on :tag_list
  
end
