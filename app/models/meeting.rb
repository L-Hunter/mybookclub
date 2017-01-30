class Meeting < ApplicationRecord

	belongs_to :club
	
	has_one :book, through: :choice
	accepts_nested_attributes_for :book

	has_one :choice
	accepts_nested_attributes_for :choice
end
