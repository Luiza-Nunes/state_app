Rails.application.routes.draw do
  get 'site/index'
  get 'site/search'

  root to: 'site#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
