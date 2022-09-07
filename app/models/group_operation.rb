class GroupOperation < ApplicationRecord
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'
  belongs_to :operation, class_name: 'Operation', foreign_key: 'operation_id'
end
