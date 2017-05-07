class AddTimeToTarefas < ActiveRecord::Migration[5.0]
  def change
    add_column :tarefas, :hour, :time
  end
end
