class UsersController < ApplicationController
  respond_to :js, :html
  before_action :find_and_authorize_user, except: %i[new create index]

  def index
    authorize User

    @users = User.all
    @users_cnt = @users.count

    respond_with @users
  end

  def show
    @user.password = nil

    respond_with @user
  end

  def new
    @user = User.new

    respond_with @user
  end

  def create
    @user = User.new(params[:user])
    @user.save

    respond_with @user
  end

  def update
    @user.update(params[:user])

    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  private

  def find_and_authorize_user
    @user = User.find(params[:id])
    authorize @user
  end
end