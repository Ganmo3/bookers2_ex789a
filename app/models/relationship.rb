class Relationship < ApplicationRecord
  
  belongs_to :follower, class_name: "User", foreign_key: :follower_id
  belongs_to :followed, class_name: "User", foreign_key: :followed_id

  belongs_to :follower, class_name: "User", foreign_key: :follower_id, inverse_of: :active_relationships
  belongs_to :followed, class_name: "User", foreign_key: :followed_id, inverse_of: :passive_relationships

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
end
