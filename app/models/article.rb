class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :author, presence: true,
                    length: { minimum: 2, maximum: 40 }
  validates :title, presence: true,
                    length: { minimum: 2, maximum: 40 }
  validates :text, presence: true,
                    length: { minimum: 2, maximum: 400 }
end
