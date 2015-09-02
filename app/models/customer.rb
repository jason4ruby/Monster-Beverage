class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## validations
  validates :first_name, :last_name, :country, :postal_code, :city, presence: true
  ## association
  has_many :orders, dependent: :destroy

end
