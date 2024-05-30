class User < ApplicationRecord
  has_many :collections
  has_many :collections, dependent: :destroy
  has_many :items, through: :collections, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def blocked?
    self.blocked != "active"
  end
end
