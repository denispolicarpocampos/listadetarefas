class RemoveDataToTarefas < ActiveRecord::Migration[5.0]
  def change
    remove_column :tarefas, :data, :date
  end
end
