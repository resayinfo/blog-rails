class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  # validates_presence_of :user_id

  validates :body, presence: true,
                    length: { minimum: 1, maximum: 100000000 }
end
