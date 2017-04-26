class Tarefa < ApplicationRecord
	belongs_to :user
	validates :titulo, presence: true,
                    length: { minimum: 5 }
    scope :complete, -> { where(complete: true) }
end