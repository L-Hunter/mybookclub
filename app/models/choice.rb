class Choice < ApplicationRecord

  belongs_to :book
  belongs_to :meeting

	validates :book_id, presence: true
	validates :meeting_id, presence: true
	validates_inclusion_of :selected, :in => [true, false]

end
