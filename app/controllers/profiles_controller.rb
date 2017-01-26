class ProfilesController < ApplicationController
  def index
  end

  def show
    # @current_user = current_user
    # @clubs = Club.all
    # @meetings = Meeting.all
    # @user = User.find(params[:id])
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
