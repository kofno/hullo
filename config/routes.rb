Rails.application.routes.draw do

  resource :welcome

  resources :conversations do
    resources :messages
  end

  root "welcome#show"

  mount ActionCable.server => '/cable'

end
