Rails.application.routes.draw do

  post 'invitations/send_invitation_email'

  get 'home/welcome'

  match ':controller(/:action(/:id))', :via => [:get, :post, :patch, :delete]

  get 'teams/create'

  post 'teams/create_team'

  post 'rooms/create_room'

  get 'teams/list'

  get 'teams/team'

  get 'rooms/show'

  get ":team_name/rooms/:room_name", to: 'rooms#show', as: :room

  devise_for :users
  root to: 'home#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
