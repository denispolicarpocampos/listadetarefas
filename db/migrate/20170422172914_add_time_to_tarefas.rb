class AddTimeToTarefas < ActiveRecord::Migration[5.0]
  def change
    add_column :tarefas, :time, :time
  end
end
