class Book < ApplicationRecord

	has_and_belong_to_many :users
	has_many :choices
	has_many :meetings, through :choice
end
