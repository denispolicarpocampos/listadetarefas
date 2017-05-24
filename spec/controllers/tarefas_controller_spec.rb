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
	      it "saves the new country in the database" do
	        expect{
	          post :create, tarefa: attributes_for(:tarefa)
	        }.to change(Tarefa, :count).by(1)
	      end

	      it "redirects to countries#show" do
	        post :create, tarefa: attributes_for(:tarefa)
        	expect(response).to redirect_to Tarefa.first
	      end
	    end

		context "with invalid attributes" do
	      it "does not save the new country in the database" do
	        post :create, tarefa: attributes_for(:tarefa, titulo: nil)
	        expect(Tarefa.count).to eq(0)
	      end

	      it "does not save the new country in the database" do
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
	      @tarefa = create(:tarefa, titulo: 'Titulo', descricao: 'testando', data: '18/06/2017 20:00', complete: false)
		end

	    context "with valid attributes" do

	      it "locates the requested @country" do
	        patch :update, id: @tarefa, tarefa: attributes_for(:tarefa)
	        expect(:tarefa).to eq(@tarefa)
	      end
	    end 
	end
end

