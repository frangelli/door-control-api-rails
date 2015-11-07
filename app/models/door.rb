class Door < ActiveRecord::Base

	has_and_belongs_to_many :users

	def self.default_fields
		[:id, :title, :description, :is_open]
	end

	def as_json(options={})
    	super({ include: [:users] }.merge(options))
  	end
end
