Rails.application.routes.draw do
  get '/' => "duplicate#index"

  get 'duplicate/search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
