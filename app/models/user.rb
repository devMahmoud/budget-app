class User < ApplicationRecord
  has_many :operations, foreign_key: 'author_id'
  has_many :groups, foreign_key: 'author_id'

  validates :name, presence: true
end