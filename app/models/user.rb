class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :posts

 	def gravatar_url
 	  gravatar_id = Digest::MD5::hexdigest(email).downcase
 	  "http://gravatar.com/avatar/#{gravatar_id}.png?s=80"
 	end
end
