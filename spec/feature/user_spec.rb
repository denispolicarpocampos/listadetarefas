require 'rails_helper'


RSpec.feature "New Tarefa" do

  let(:user) { FactoryGirl.create(:user) }
  let(:tarefa) { FactoryGirl.create(:tarefa, user: user) }

  background do
    login_as(user, scope: :user)
  end

  context "create new tarefa" do
    it "preenchendo os campos" do
      visit '/tarefas/new'
      within("#new_tarefa") do
        fill_in 'tarefa_titulo', with: 'user@example.com'
        fill_in 'tarefa_descricao', with: 'password'
        fill_in 'tarefa_data', with: '18/06/1990 20:00'
      end
      click_button 'submit'
      expect(page).to have_content 'Mostra a tarefa selecionada'
    end
  end

  context "edit new tarefa" do
    it "alterando os campos" do
      visit edit_tarefa_path(tarefa)
      fill_in 'tarefa_titulo', with: 'user@exa12mple.com'
      fill_in 'tarefa_descricao', with: 'passw213ord'
      fill_in 'tarefa_data', with: '18/06/2018 21:00'
      click_button 'submit'
      expect(page).to have_content 'Mostra a tarefa selecionada'
    end
  end

   context "delete new tarefa" do
    it "alterando os campos" do
      visit "/tarefas"
      click_on('Nova Tarefa')
      fill_in 'tarefa_titulo', with: 'user@exa12mple.com'
      fill_in 'tarefa_descricao', with: 'passw213ord'
      fill_in 'tarefa_data', with: '18/06/2018 21:00'
      click_button 'submit'
      click_on 'Voltar'
      expect { click_on 'Apagar' }.to change(Tarefa, :count).by(-1)
    end
  end
end