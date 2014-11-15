class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 4, maximum: 12 }
  validates :text, presence: true,
                    length: { minimum: 4, maximum: 120 }
end
