class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commenter, presence: true,
                    length: { minimum: 2, maximum: 25 }
  validates :body, presence: true,
                    length: { minimum: 2, maximum: 500 }
end
