class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 4, maximum: 8 }
  validates :text, presence: true,
                    length: { minimum: 4, maximum: 40 }
end
