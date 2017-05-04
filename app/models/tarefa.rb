class Tarefa < ApplicationRecord
	belongs_to :user
	validates :titulo, presence: true, length: { minimum: 5 }
	validates :data, presence: true

    scope :complete, -> { where(complete: true) }
end