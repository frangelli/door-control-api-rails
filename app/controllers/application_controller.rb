class ApplicationController < ActionController::Base
	include DeviseTokenAuth::Concerns::SetUserByToken
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :null_session
	before_action :configure_permitted_parameters, if: :devise_controller?

	respond_to :json

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << [:username, :name, :nickname, :is_admin]
	end
end
