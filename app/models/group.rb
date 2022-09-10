class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :group_operations, dependent: :delete_all
  has_many :operations, through: :group_operations

  validates :name, presence: true, length: { maximum: 80 }
  validates :icon, presence: true

  def operations_total_cost
    operations.sum(:amount)
  end
end
