Rails.application.routes.draw do
  resources :exchanges do
    collection do
      post 'reload'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
