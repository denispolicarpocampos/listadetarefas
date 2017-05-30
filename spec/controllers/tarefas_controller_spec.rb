require 'rails_helper'

RSpec.describe TarefasController, type: :controller do
	 login_user

	describe 'GET #index' do
		it "renders the :index template" do
      		get :index
      		expect(response).to render_template :index
    	end
  	end


  	describe 'GET #show' do
	    it "renders the :show template" do
	      tarefa = create(:tarefa)
	      get :show, id: tarefa
	      expect(response).to render_template :show
	    end
  	end

  	describe 'GET #new' do
	    it "renders the :new template" do
	      get :new
	      expect(response).to render_template :new
	    end
  	end

  	describe 'GET #edit' do
	    it "renders the :edit template" do
	      tarefa = create(:tarefa)
	      get :edit, id: tarefa
	      expect(response).to render_template :edit
	    end
  	end

  	describe 'POST #create' do
	    context "with valid attributes" do
	      it "saves the new tarefa in the database" do
	        expect{
	          post :create, tarefa: attributes_for(:tarefa)
	        }.to change(Tarefa, :count).by(1)
	      end

	      it "redirects to tarefas#show" do
	        post :create, tarefa: attributes_for(:tarefa)
        	expect(response).to redirect_to Tarefa.first
	      end
	    end

		context "with invalid attributes" do
	      it "does not save the new tarefa in the database" do
	        post :create, tarefa: attributes_for(:tarefa, titulo: nil)
	        expect(Tarefa.count).to eq(0)
	      end

	      it "does not save the new tarefa in the database" do
	        post :create, tarefa: attributes_for(:tarefa, data: nil)
	        expect(Tarefa.count).to eq(0)
	      end

	      it "re-renders the :new template" do
	        post :create, tarefa: attributes_for(:tarefa, data: nil)
	        expect(response).to render_template :new
	      end

	      it "re-renders the :new template" do
	        post :create, tarefa: attributes_for(:tarefa, titulo: nil)
	        expect(response).to render_template :new
	      end
    	end
	end

	describe 'PATCH #update' do
	    before :each do
	    	@tarefa = create(:tarefa, user: subject.current_user, titulo: 'Titulo', descricao: 'testando', data: '18/06/2017 20:00', complete: false)
		end

	    context "with valid attributes" do
	    	it "locates the requested @tarefa" do
	    		patch :update, id: @tarefa.id, tarefa: { titulo: 'Titulo', descricao: 'testando', data: '18/06/2017 20:00', complete: false}
      			expect(assigns(:tarefa)).to eq(@tarefa)
	    	end

	    	it "change @tarefa attributes" do
		    	patch :update, id: @tarefa.id, tarefa: attributes_for(:tarefa, titulo: 'Titulo2', descricao: 'testando2', data:'18/06/2017 21:00', complete: false)
		    	@tarefa.reload
		    	expect(@tarefa.titulo).to eq('Titulo2')
	        	expect(@tarefa.descricao).to eq('testando2')
	        	expect(@tarefa.data).to eq("2017-06-18 21:00:00.000000000 -0300")
	        end

	    	it "redirects to the updated tarefa" do
		        patch :update, id: @tarefa.id,
		        tarefa: attributes_for(:tarefa)
		        expect(response).to redirect_to @tarefa
      		end
	    end

	    context "with invalid attributes" do
	      it "does not change the tarefa attributes" do
	        patch :update, id: @tarefa,
	        tarefa: attributes_for(:tarefa, titulo: 'titulo2', descricao: nil, data: nil, complete: false)
	        @tarefa.reload
	        expect(@tarefa.titulo).not_to eq('titulo2')
	        expect(@tarefa.descricao).to eq('testando')
	       	expect(@tarefa.data).to eq("2017-06-18 20:00:00.000000000 -0300")
      	  end

	      it "re-renders the :edit template" do
	        patch :update, id: @tarefa,
	        tarefa: attributes_for(:tarefa, titulo: nil)
	        expect(response).to render_template :edit
	      end
    	end
	end

	describe 'DELETE destroy' do
		before :each do
			@tarefa = create(:tarefa, user: subject.current_user, titulo: 'Titulo', descricao: 'testando', data: '18/06/2017 20:00', complete: false)
		end

		it "deletes the contact" do
			expect{
				delete :destroy, id: @tarefa.id        
				}.to change(Tarefa, :count).by(-1)
			end
    	it "redirects to contacts#index" do
    		delete :destroy, id: @tarefa.id
    		response.should redirect_to tarefas_path
  		end
	end

	describe 'GET #complete_index' do
		it "renders the :index template" do
			get :complete_index
			expect(response).to render_template :complete_index
		end
	end

	describe 'GET #edit_complete_task' do
		before :each do
			@tarefa = create(:tarefa, user: subject.current_user, titulo: 'Titulo', descricao: 'testando', data: '18/06/2017 20:00', complete: false)
		end
		
		it "renders the :index template" do
			xhr :get, :edit_complete_task, id: @tarefa.id
			expect(response).to render_template :edit_complete_task
		end
	end

end


describe "user settings" do
  let(:authed_user) { create_logged_in_user }

  it "should allow access" do
    visit user_settings_path(authed_user)
    # should be good!
  end
end