class RemoveHourFromTarefas < ActiveRecord::Migration[5.0]
  def change
    remove_column :tarefas, :hour, :time
  end
end
