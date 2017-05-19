require 'rails_helper'

RSpec.describe Tarefa, type: :model do
	let(:user) {User.new(email: "campos@uol.com.br", password: "senha123", sign_in_count: 1)}
	let(:tarefa) {Tarefa.new(user: user, titulo: "testevalido", descricao:"oi", data: "19/05/2017 12:00")}

	context "with required fields" do
		it "Tarefa válida?" do
			expect(tarefa).to be_valid
		end
	end

	context "without data" do
		it "Tarefa inválida?" do
			tarefa.data = nil
			expect(tarefa).to be_invalid
		end
	end

	context "without titulo" do
		it "Tarefa invalida?" do
			tarefa.titulo = nil
			expect(tarefa).to be_invalid
		end
	end

	context "without descricao" do
		it "Tarefa invalida?" do
			tarefa.descricao = nil
			expect(tarefa).to be_valid
		end
	end
end
