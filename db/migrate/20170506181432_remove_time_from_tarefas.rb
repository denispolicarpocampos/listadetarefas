class RemoveTimeFromTarefas < ActiveRecord::Migration[5.0]
  def change
    remove_column :tarefas, :time, :time
  end
end