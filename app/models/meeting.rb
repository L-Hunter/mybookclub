class Meeting < ApplicationRecord

	belongs_to :club
	
	has_one :book, through: :choice
	accepts_nested_attributes_for :book

	has_one :choice
	accepts_nested_attributes_for :choice

	validates :date, presence: true
	validates :time, presence: true
	# validates :host, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	# validates :comment, presence: true
	
end
