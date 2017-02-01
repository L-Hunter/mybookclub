class Book < ApplicationRecord

	has_and_belongs_to_many :users
	has_many :choices
	has_many :meetings, through: :choice

	validates :title, presence: true
	validates :author, presence: true
	validates :image, presence: true
	validates :description, presence: true

end
