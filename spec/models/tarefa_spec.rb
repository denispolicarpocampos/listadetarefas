require 'rails_helper'

RSpec.describe Tarefa, type: :model do


	context "Testando a view user" do
		it "Cadastrar um usuário" do
	    	visit 'tarefas/new'
	    	within(".new_tarefa") do
	      		fill_in 'Título', with: 'campos_bra@hotmail.com'
	      		fill_in 'Descrição', with: '123mudar'
	      		fill_in 'Data', with: '18/06/2017 20:00'
	    	end
	    	click_button 'submit'
	    	expect(page).to have_content('Tarefa')
	    end
	end


	let(:user) {User.new(email: "campos@uol.com.br", password: "senha123", sign_in_count: 1)}
	let(:tarefa) {Tarefa.new(user: user, titulo: "testevalido", descricao:"oi", data: "24/05/2017 20:00")}

	context "Com todos campos preenchidos" do
		it "Tarefa válida?" do
			tarefa = build(:tarefa)
			expect(tarefa).to be_valid
		end
	end

	context "Com data nula" do
		it "Tarefa inválida?" do
			tarefa = build(:tarefa, data: nil)
			expect(tarefa).to be_invalid
		end
	end

	context "Com título nulo" do
		it "Tarefa invalida?" do
			tarefa = build(:tarefa, titulo: nil)
			expect(tarefa).to be_invalid
		end
	end

	context "Com descrição nula" do
		it "Tarefa invalida?" do
			tarefa = build(:tarefa, descricao: nil)
			expect(tarefa).to be_valid
		end
	end

	context "Com caracteres do título maior que 5" do
		it "Tarefa valida?" do
			expect(tarefa.titulo.size).to be >= 5
		end
	end

	context "Datetime anterior a data de hoje" do
		it "Tarefa invalida?" do
			tarefa = build(:tarefa, data: '21/05/2017 20:00')
			expect(tarefa).to be_invalid
		end
	end


end
