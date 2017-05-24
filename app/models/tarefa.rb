class Tarefa < ApplicationRecord
	belongs_to :user
	validates_presence_of :titulo, message: 'não pode ficar em branco'
	validates :titulo, length: { minimum: 5 }
	validates_datetime :data, :on_or_after => lambda { Time.zone.now }
	#validates :data, date: { after_or_equal_to: Proc.new { Time.current } }
	validates_presence_of :data, message: 'e hora devem ser preenchidas'
    scope :complete, -> { where(complete: true) }


end