class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  validates :password, presence: true, length: {minimum: 8, maximum: 128}, on: :create
  validates :password, length: {minimum: 8, maximum: 128}, on: :update, allow_blank: true

  # validates :biography, presence: true,
  #                   length: { minimum: 2, maximum: 100000000 }

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_save :ensure_authentication_token

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  # Token authentication
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

end
