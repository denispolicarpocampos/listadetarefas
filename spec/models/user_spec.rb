require 'rails_helper'

RSpec.describe User, type: :model do
	context "Validade de um usuário" do
		let(:user) {User.new( email: "campos2@uol.com.br", password: "senha123234", sign_in_count: 2)}
		it "Usuário válido?" do
			expect(user).to be_valid
		end
	end
end
