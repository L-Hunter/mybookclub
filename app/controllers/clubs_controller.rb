class ClubsController < ApplicationController
  def index
    # @clubs = Club.all
    @users = User.all
    if params[:search]
      @clubs = Club.search(params[:search]).order("created_at DESC")
    else
      @clubs = Club.all.order("created_at DESC")
    end
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
      flash[:notice] = ""
      redirect_to @club
    else
      flash[:alert] = "Error saving club! Please complete all form fields."
      render new_club_path
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      flash[:notice] = ""
      redirect_to club_path
    else
      flash[:alert] = "Error updating club! Please complete all form fields."
      redirect_to edit_club_path
    end
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
