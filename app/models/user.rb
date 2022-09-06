class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :expenses

  validates :name, presence: true, format: { with: /[a-zA-Z]/ }
  validates :role, presence: true, format: { with: /[a-zA-Z]/ }
  validates :email, presence: true, format: { with: Devise.email_regexp }

  def admin?
    role == 'admin'
  end
end
