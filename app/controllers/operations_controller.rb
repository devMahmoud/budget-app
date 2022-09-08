class OperationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @operations = Group.find(params[:group_id]).operations
  end

  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.author_id = current_user.id
    @group = Group.find(params[:group_id])
    if @operation.save
      GroupOperation.create(group_id: @group.id, operation_id: @operation.id)
      redirect_to group_operations_path,
                  flash: { success: 'Transaction created successfully.' }
    else
      redirect_to new_group_operation_path, flash: { error: @operation.errors.full_messages }
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end
end
