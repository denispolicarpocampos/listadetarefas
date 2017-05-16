Rails.application.routes.draw do

	devise_for :users
 
	resources :tarefas do
		member do
      get :complete_update
      get :incomplete_task
      get :edit_complete_task
    	end
    	
    collection do
      get :complete_index
    end
  end


	root 'home#index'

end
