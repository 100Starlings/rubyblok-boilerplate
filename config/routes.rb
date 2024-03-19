Rails.application.routes.draw do
  resources :storyblok_webhook, only: :create
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  root to: redirect('/home')

  get '/:page' => 'pages#index'
  match '*path', to: 'application#render_not_found', via: :all
end
