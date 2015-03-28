class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  belongs_to :user
  # validates :author, presence: true,
  #                   length: { minimum: 2, maximum: 25 }
  validates :title, presence: true,
                    length: { minimum: 1, maximum: 25 }
  validates :text, presence: true,
                    length: { minimum: 1, maximum: 10000000 }
end
