class Marker < ActiveRecord::Base
	belongs_to :user

	validates :marker_content, presence: :true,
	                             length: { minimum: 10 }

	validates :user_id, presence: :true
end
