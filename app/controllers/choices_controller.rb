class ChoicesController < ApplicationController
  def index
  end

  def show
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
    @choice = Choice.find(params[:id])
    @meeting = Meeting.find(@choice.meeting_id)
    @choice.destroy
    redirect_to club_meeting_path(@meeting.club, @meeting)
  end

  private

  def choice_params
    params.require(:choice).permit(:book_id, :meeting_id, :selected, :category)
  end

end
