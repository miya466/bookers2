class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @book = @user.books
  end

  def edit
     @user = User.find(params[:id])
     unless @user == current_user
      redirect_to current_user
     end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end

end