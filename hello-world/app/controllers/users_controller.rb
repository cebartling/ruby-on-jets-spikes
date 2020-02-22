class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :delete]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      if request.xhr?
        render json: {success: true, location: url_for(@user)}
      else
        redirect_to user_path(@user)
      end
    else
      render :new
    end
  end

  # PUT /users/1
  def update
    if @user.update(user_params)
      if request.xhr?
        render json: {success: true, location: url_for(@user)}
      else
        redirect_to user_path(@user)
      end
    else
      render :edit
    end
  end

  # DELETE /users/1
  def delete
    @user.destroy
    if request.xhr?
      render json: {success: true}
    else
      redirect_to users_path
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age)
  end
end
