class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
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

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to @group
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to group_path, notice:  "El grupo ha sido eliminado exitosamente"
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
        participating_users_attributes: [
          :user_id,
          :role,
          :id,
          :_destroy
        ]
      )
    end
end
