class Operation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :group_operations, dependent: :delete_all
  has_many :groups, through: :group_operations

  validates :name, presence: true, length: { maximum: 80 }
  validates :amount, presence: true, numericality: { greater_than: 0, alert: 'Amount must be greater than 0' }
end
