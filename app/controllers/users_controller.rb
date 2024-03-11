class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to dashboard_path(@user), notice: 'User information was updated'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo, :first_name, :last_name, :address)
  end

end
