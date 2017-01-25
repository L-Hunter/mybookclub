class Club < ApplicationRecord
	
	has_and_belongs_to_many :meetings

	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
