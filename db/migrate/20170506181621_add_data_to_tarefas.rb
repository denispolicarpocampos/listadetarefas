class AddDataToTarefas < ActiveRecord::Migration[5.0]
  def change
    add_column :tarefas, :data, :datetime
  end
end
