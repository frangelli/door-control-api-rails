Rails.application.routes.draw do
  resources :doors, defaults: {format: :json}
  put 'doors/toggle_door/:id' => 'doors#toggle_door', defaults: {format: :json}
  put 'doors/set_users/:id' => 'doors#set_users', defaults: {format: :json}
  get 'doors_activities' => 'doors#activities', defaults: {format: :json}
  resources :users, defaults: {format: :json}
  mount_devise_token_auth_for 'User', at: 'auth'
end
