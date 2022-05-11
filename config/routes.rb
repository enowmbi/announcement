Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "notifications#index"
      resources :notifications, only: %i[index show create update destroy] do
        collection do
          get :search
        end
      end
    end
  end
end
