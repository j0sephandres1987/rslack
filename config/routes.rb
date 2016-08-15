Rails.application.routes.draw do
  get 'teams/create'

  post 'teams/create_team'

  get 'teams/list'

  get 'rooms/show'

  devise_for :users
  root to: 'rooms#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
