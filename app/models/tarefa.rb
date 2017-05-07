class Tarefa < ApplicationRecord
	belongs_to :user
	validates_presence_of :titulo, message: 'não pode ficar em branco'
	validates_presence_of :data, message: 'e hora devem ser preenchidas'
	validates_length_of :titulo, minimum: 5, message: 'deve ter no mínimo 5 caracteres'
	validate :past_date
    scope :complete, -> { where(complete: true) }

    def past_date
    	if self.data < Date.today
    		errors.add( :data, 'não pode ser no passado')
    	end
    end


end