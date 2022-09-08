class GroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @groups = Group.where(author_id: current_user.id)
    # @groups = @user.groups.includes(:author)
  end

  def show
    @group = Group.find(params[:id])
    @operations = @group.operations.where(author_id: current_user.id).order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path,
                  flash: { success: 'Group created successfully.' }
    else
      redirect_to new_group_path, flash: { error: @group.errors.full_messages }
    end
  end
end
