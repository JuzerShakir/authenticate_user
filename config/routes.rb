Rails.application.routes.draw do
  root to: 'home#index'

  #devise_for :visitors, controllers: { registrations: "registrations"}

  devise_scope :visitor do
    post '/sign_up', to: 'devise/registrations#create', as: :visitor_registration
    post '/password/new', to: 'devise/passwords#create', as: :visitor_password
    put '/password/new', to: 'devise/passwords#update'
  end

  # path will remove '/visitor' text from url
  # with path_names we can change text of a link, this changes link text from 'sign_in' to 'login'
  devise_for :visitors, path: '', path_names: { sign_in: 'login' }

  # if a visitor manually types any url that isn't mentioned in routes it will show a specific page saying page not found
  get ':not_found', to: 'home#not_found', constraints: { not_found: /.*/ }

end
