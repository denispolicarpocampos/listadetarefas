require 'rails_helper'

describe "Tarefas", :type => :feature do

  feature "New Tarefa" do
    background do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    context "create new tarefa" do
     it "signs me in" do
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
     it "signs me in" do
        tarefa = FactoryGirl.create(:tarefa)
        visit edit_tarefa_path(tarefa.id)
        within("#new_tarefa") do
          fill_in 'tarefa_titulo', with: 'user@exa12mple.com'
          fill_in 'tarefa_descricao', with: 'passw213ord'
          fill_in 'tarefa_data', with: '18/06/1990 21:00'
        end
        click_button 'submit'
        expect(page).to have_content 'Mostra a tarefa selecionada'
      end

      it "is successful when clicking the destroy link" do
        visit "/tarefas"
        within("#apagar") do                                
          click_link ('Apagar') 
        end          
        expect(page).to have_content("Tem certeza?")
      end

    end
  end
end