# frozen_string_literal: true

# Class to manage the group requests and giving actions for render its views
class GroupsController < ApplicationController
  load_and_authorize_resource
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!
  layout 'dashboard'
  def index
    @groups_owned = Group.owned_restrict_groups(current_user)
    @groups = Group.participating(current_user.id)
  end

  def new
    if current_user.can_create_groups?
      @group = Group.new
    else
      redirect_to groups_path, notice: 'You need upgrade your account to create more groups'
    end
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      redirect_to @group, notice: 'Group was successfully created'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to @group
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'El grupo ha sido eliminado exitosamente'
  end

  private

  def set_group
    @group = Group.find params[:id]
  end

  def group_params
    params.require(:group).permit(
      :name,
      :description,
      :amount,
      :owner_id,
      :category_id,
      participating_users_attributes: Participant.attribute_names.map(&:to_sym).push(:_destroy)
    )
  end
end
