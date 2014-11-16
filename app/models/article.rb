class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 2, maximum: 20 }
  validates :text, presence: true,
                    length: { minimum: 2, maximum: 400 }
end
