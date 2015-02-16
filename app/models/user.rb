class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :password, presence: true
  validates :password, presence: true, length: {minimum: 8, maximum: 128}, on: :create
  validates :password, length: {minimum: 8, maximum: 128}, on: :update, allow_blank: true

  # validates :biography, presence: true,
  #                   length: { minimum: 2, maximum: 500000 }

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
