Rails.application.routes.draw do

	devise_for :users
 
	resources :tarefas do
		member do
   		post :complete_update
    	get :complete_update
      post :incomplete_task
      get :incomplete_task
    	end
    	
    collection do
      post :complete_index
      get :complete_index
    end
  end


	root 'home#index'

end
