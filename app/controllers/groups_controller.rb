class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
 @group = Group.new
end
end
def show
  @group = Group.find(params[:id])
end
def edit
end

def update
    if @group.update(group_params)
    redirect_to groups_path, notice: "Update Success"
  else
    render :edit
  end
end
def destroy
    @group.destroy
    redirect_to groups_path, alert: "Group deleted"
  end
private
def find_group_and_check_permission
    @group = Group.find(params[:id])

    if current_user != @group.user
      redirect_to root_path, alert: "You have no permission."
    end
  end
def group_params
  params.require(:group).permit(:title, :description)
end
end
