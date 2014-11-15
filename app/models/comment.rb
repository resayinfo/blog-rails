class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commenter, presence: true,
                    length: { minimum: 4, maximum: 12 }
  validates :body, presence: true,
                    length: { minimum: 4, maximum: 120 }
end
