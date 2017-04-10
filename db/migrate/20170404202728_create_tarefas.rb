class CreateTarefas < ActiveRecord::Migration[5.0]
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.text :descricao
      t.datetime :data
      t.timestamps
    end
  end
end
