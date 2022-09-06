class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :groups
    has_many :expenses

    validates :name, presence: true
    validates :role, presence: true
    
    def admin?
      current_user.role=="admin"
    end
  end
  