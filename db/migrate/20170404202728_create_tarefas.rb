class CreateTarefas < ActiveRecord::Migration[5.0]
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.text :descricao
      t.belongs_to :user, index: true
      t.datetime :data
      t.timestamps
    end
  end
end
