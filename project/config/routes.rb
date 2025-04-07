Rails.application.routes.draw do
  namespace 'web_test' do
    get 'welcome', to: 'welcome#index'

    get 'welcome/create', to: 'welcome#create'

    get 'welcome/update', to: 'welcome#update'

    get 'welcome/delete', to: 'welcome#delete'

    get 'welcome/aleatory_din', to: 'welcome#aleatory_din'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
