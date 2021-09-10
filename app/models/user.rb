class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :artists
  has_many :events
  has_many :orders, dependent: :destroy

  def full_name
    "#{first_name} #{name}"
  end
end
