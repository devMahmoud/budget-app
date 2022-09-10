class OperationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @operation = Operation.new
  end

  def create
    puts "my params: #{params.inspect}"
    @operation = Operation.new(operation_params)
    @operation.author_id = current_user.id
    if @operation.save
      GroupOperation.create(group_id: params[:group_id], operation_id: @operation.id)
      redirect_to group_path(id: params[:group_id]),
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
