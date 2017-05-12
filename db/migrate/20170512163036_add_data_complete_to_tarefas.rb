class AddDataCompleteToTarefas < ActiveRecord::Migration[5.0]
  def change
    add_column :tarefas, :data_complete, :datetime
  end
end
