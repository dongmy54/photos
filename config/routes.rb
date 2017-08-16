Rails.application.routes.draw do
  root 'welcome#index'
  resources :photos do
    collection do
      get :empty
      get :family
      get :animals
      get :children
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
