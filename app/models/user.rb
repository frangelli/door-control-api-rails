class User < ActiveRecord::Base
  	# Include default devise modules.
	devise :database_authenticatable, :registerable

	include DeviseTokenAuth::Concerns::User

	has_and_belongs_to_many :doors
	
	has_many :activities

	def self.default_fields
		[:id, :name, :nickname, :email, :password, :image, :is_admin]
	end

	def as_json(options={})
    	super({ include: [:doors] }.merge(options))
  	end
end
