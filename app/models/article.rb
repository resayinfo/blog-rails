class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :author, presence: true,
                    length: { minimum: 2, maximum: 25 }
  validates :title, presence: true,
                    length: { minimum: 2, maximum: 25 }
  validates :text, presence: true,
                    length: { minimum: 2, maximum: 1000000 }
end
