class RemoveTimeToTarefas < ActiveRecord::Migration[5.0]
  def change
    remove_column :tarefas, :time, :datetime
  end
end
