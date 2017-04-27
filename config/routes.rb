Rails.application.routes.draw do

	devise_for :users
 
	resources :tarefas do
		member do
   			post :complete
    		get :complete
    		post :continuetask
    		get :continuetask
    	end
    	
    	collection do
   			post :complete
    		get :complete
    		post :continuetask
    		get :continuetask
    	end
  	end


	root 'home#index'

end
