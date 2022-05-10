Rails.application.routes.draw do
  get 'announcements/index'
  get 'announcements/show'
  get 'announcements/create'
  get 'announcements/update'
  get 'announcements/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
