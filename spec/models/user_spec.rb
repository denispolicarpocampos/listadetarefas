require 'rails_helper'

RSpec.describe User, type: :model do


	context "Testando a view user" do
		it "Cadastrar um usuário" do
	    	visit 'users/sign_in'
	    	within("#new_user") do
	      		fill_in 'Email', with: 'campos_bra@hotmail.com'
	      		fill_in 'Password', with: '123mudar'
	    	end
	    	click_button 'Log in'
	    	expect(page).to have_content('Lista de tarefas')
	    end
	end

	let(:user) {User.new(email: "campos@uol.com.br", password: "senha123", sign_in_count: 2)}
	
	context "Validade de um usuário" do
		it "Usuário válido?" do
			expect(user).to be_valid
		end
	end

	context "Com email nulo" do
		it "Usuário inválido?" do
			user.email = nil
			expect(user).to be_invalid
		end
	end

	context "Com password nulo" do
		it "Usuário inválido?" do
			user.password = nil
			expect(user).to be_invalid
		end
	end

	context "Com email com formato invalido" do
		it "Usuário inválido?" do
			user.email = "oi@teste"
			expect(user).to be_invalid
		end
	end

end
