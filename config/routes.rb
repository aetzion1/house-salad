Rails.application.routes.draw do
  root to: "welcome#index"

  # WHY DOESNT WORK? resources :search, only: [:index] # PREFIX IS SEARCH_INDEX
  get "/search", to: "search#index"
end
