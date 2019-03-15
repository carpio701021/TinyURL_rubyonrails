Rails.application.routes.draw do
  root "tinyurls#index"
  get 'catch_all/index'
  resources :tinyurls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '*path', to: 'catch_all#index'
end
