Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "announcements#index"
      resources :announcements, only: %i[index show create update destroy]
    end
  end
end
