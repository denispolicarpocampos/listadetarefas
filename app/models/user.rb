class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tarefas

  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
