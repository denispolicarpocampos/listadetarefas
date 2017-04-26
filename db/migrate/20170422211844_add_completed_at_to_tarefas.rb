class AddCompletedAtToTarefas < ActiveRecord::Migration[5.0]
  def change
    add_column :tarefas, :complete, :boolean, default: false
  end
end
