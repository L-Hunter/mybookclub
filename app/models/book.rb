class Book < ApplicationRecord

	has_and_belongs_to_many :users
	has_many :choices
	has_many :meetings, through: :choice

end
