Rails.application.routes.draw do
  root 'photos#index'
  
  resources :photos do
    collection do
      get :untag
      get :family
      get :animals
      get :children
    end

  end
  get "/welcome" => "welcome#index"

end
