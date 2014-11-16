class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commenter, presence: true,
                    length: { minimum: 2, maximum: 20 }
  validates :body, presence: true,
                    length: { minimum: 2, maximum: 200 }
end
