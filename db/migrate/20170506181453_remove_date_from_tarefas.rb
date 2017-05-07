class RemoveDateFromTarefas < ActiveRecord::Migration[5.0]
  def change
    remove_column :tarefas, :date, :date
  end
end
