class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, foreign_key: 'author_id'
  has_many :groups
  has_one_attached :picture
  validates :picture, presence: { message: "Need a picture!" }
end
