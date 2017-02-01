class Club < ApplicationRecord
	
	has_many :meetings

	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates :club_name, presence: true
	validates_inclusion_of :is_public, :in => [true, false]
	validates :club_pass, presence: true
    validates :description, presence: true

end
