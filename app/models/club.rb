class Club < ApplicationRecord
	
	has_many :meetings

	has_attached_file :avatar, :storage => :s3, s3_region: ENV['AWS_REGION'], :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

 	def s3_credentials
	    {:bucket => ENV['S3_BUCKET_NAME'],
	    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
	    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
	end

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


	validates :club_name, presence: true
	validates_inclusion_of :is_public, :in => [true, false]
	validates :club_pass, presence: true
    validates :description, presence: true
	
	def self.search(search)
      where(" UPPER(club_name) LIKE ? OR UPPER(description) LIKE ? ", "%#{search.upcase}%", "%#{search.upcase}%") 
	end
end
