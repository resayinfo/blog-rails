class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :body, presence: true,
                    length: { minimum: 1, maximum: 1000000 }
end
