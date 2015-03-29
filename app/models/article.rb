class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 1, maximum: 25 }
  validates :text, presence: true,
                    length: { minimum: 1, maximum: 1000000000 }

  mount_uploader :poster, PosterUploader

end
