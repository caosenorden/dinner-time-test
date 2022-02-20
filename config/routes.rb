Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#show'

  resource :recipes, only: [:search] do
    get "search", to: "recipes#search"
    post "search", to: "recipes#search"
  end
end
