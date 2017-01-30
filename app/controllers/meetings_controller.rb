class MeetingsController < ApplicationController
  def index
  end

  def show
    @meeting = Meeting.find(params[:id])
    @club = Club.find(params[:club_id])
  end

  def new
    @club_id = params[:id]
    @club = Club.find(params[:club_id])
    @meeting = Meeting.new
  end

  def create
    meeting = Meeting.create(meeting_params.except(:book_attributes))
    book_params = params[:meeting][:book_attributes]
    book = Book.find_by_title(book_params[:title]) || Book.create(title: book_params[:title], author: book_params[:author], image: book_params[:image], description: book_params[:description])
    # choice = Choice.create(choice_params)
    if meeting.save
      redirect_to club_meeting_path(meeting.club_id, meeting)
    else
      redirect_to new_club_meeting_path
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @club = Club.find(params[:club_id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    redirect_to club_meeting_path
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to club_path(@meeting.club_id)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:date, :time, :host, :street, :city, :state, :zip, :comment, :club_id, :book_attributes => {})

  end

  # def book_params
  #   params.require(:book).permit(:title, :author, :image, :description)

  # end
end
