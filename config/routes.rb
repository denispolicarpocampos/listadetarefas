Rails.application.routes.draw do
   devise_for :users
 
  resources :tarefas do
   collection do
    get :complete
    post :complete
    end
  end
  root 'home#index'
end
