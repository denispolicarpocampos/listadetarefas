class Tarefa < ApplicationRecord
	belongs_to :user
	validates_presence_of :titulo, message: 'não pode ficar em branco'
	validates_presence_of :data, message: 'e hora devem ser preenchidas'
    scope :complete, -> { where(complete: true) }


end