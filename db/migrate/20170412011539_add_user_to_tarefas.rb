class AddUserToTarefas < ActiveRecord::Migration[5.0]
  def change
    add_reference :tarefas, :user, foreign_key: true
  end
end
