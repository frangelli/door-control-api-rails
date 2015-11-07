class DoorsController < ApplicationController
	before_action :set_door, only: [:set_users, :toggle_door, :show, :edit, :update, :destroy]

	def index
		@doors = Door.all
		respond_with @doors
	end

	def show
		respond_with @door
	end

	def create
		@door = Door.new(door_params)
		@door.save
		respond_with @door
	end

	def update
		@door.update(door_params)
		respond_with @door
	end

	def set_users
		users = User.find(params['user_ids'])
		@door.users = []
		@door.users << users
		@door.save
		respond_with @door
	end

	def toggle_door
		user = User.find(params[:user_id])
		action = (@door.is_open) ? "closed" : "opened"
		activity = Activity.new
		activity.user = user;
		activity.text = "#{user.name} has #{action} the door: #{@door.title}"
		@door.update(door_params)
		activity.save
		respond_with @door
	end

	def activities
		@activities = Activity.all.order(created_at: :desc).limit(50);
		respond_with @activities
	end

	def destroy
		@door.destroy
		respond_with @door
	end

	private
		def set_door
			@door = Door.find(params[:id])
		end

		def door_params
			params.require(:door).permit(Door.default_fields)
		end
end
