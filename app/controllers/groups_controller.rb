class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  
  def index
    @groups = Group.all
  end

  def new 
    @group = Group.new
    render :new
  end

  def create
    @group = Group.new(group_params)
    if @group.save 
      redirect_to @group
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
      render :edit
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
      params.require(:group).permit( :name, :description, :amount)
    end
end
