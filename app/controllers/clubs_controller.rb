class ClubsController < ApplicationController
  def index
    @clubs = Club.all
    @users = User.all
  end

  def show
    @club = Club.find(params[:id])
    @clubs = Club.all
    @users = User.all
  end

  def new
  end

  def create
    @club = Club.create(club_params)
    if @club.save
      redirect_to @club
    else
      render new_club_path
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    redirect_to club_path
  end

  def destroy
    @user = current_user
    @club = Club.find(params[:id])
    @club.destroy
    redirect_to profiles_show_path
  end

  private


  def club_params
    params.require(:club).permit(:club_name, :description, :is_public, :club_pass, :avatar, :user_id)

  end
end
