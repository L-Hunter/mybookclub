class Meeting < ApplicationRecord

	belongs_to :club
	
	has_one :book, through: :choice
	accepts_nested_attributes_for :book

	has_one :choice
	accepts_nested_attributes_for :choice

	validates :datetime, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	# validates :comment, presence: true
	
	def self.search(search)
      where("date LIKE ? OR time LIKE ? OR host LIKE ? OR street LIKE ? OR city LIKE ? OR state LIKE ? OR zip LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
	end

	def full_street_address
	  [street, city, state, zip].compact.join(', ')
	end
 
	geocoded_by :full_street_address
	after_validation :geocode
end
