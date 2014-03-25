Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
    resources :favorites, :only => :index do
      get :users, :on => :member
    end
  end

  resources :favorites, :only => [:index, :create, :destroy]
end
