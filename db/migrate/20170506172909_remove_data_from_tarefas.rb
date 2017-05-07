class RemoveDataFromTarefas < ActiveRecord::Migration[5.0]
  def change
    remove_column :tarefas, :data, :datetime
  end
end
