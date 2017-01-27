class MeetingsController < ApplicationController
  def index
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
  end

  def create
    @meeting = Meeting.create(meeting_params)
    if @meeting.save
      redirect_to @meeting
    else
      render new_meeting_path
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    redirect_to meeting_path
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to club_path(@meeting.club_id)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:date, :time, :host, :street, :city, :state, :zip, :comment, :club_id)

  end
end
