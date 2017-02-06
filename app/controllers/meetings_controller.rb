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
    book_params = params[:meeting][:book_attributes]
    book = Book.find_by_title(book_params[:title]) || Book.create(title: book_params[:title], author: book_params[:author], image: book_params[:image], description: book_params[:description])
    meeting = Meeting.create(meeting_params.except(:book_attributes, :choice_attributes))
    choice_params = params[:meeting][:choice_attributes]
    choice = Choice.create(book_id: book.id, meeting_id: meeting.id, selected: choice_params[:selected], category: choice_params[:category])
    if meeting.save
      flash[:notice] = ""
      redirect_to club_meeting_path(meeting.club_id, meeting)
    else
      flash[:alert] = "Error saving meeting! Please complete all form fields."
      redirect_to new_club_meeting_path
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @club = Club.find(params[:club_id])
    # @choice = @meeting.choice.id
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params.except(:book_attributes, :choice_attributes))
    book_params = params[:meeting][:book_attributes]
    @book = Book.find_by_title(book_params[:title]) || Book.create(title: book_params[:title], author: book_params[:author], image: book_params[:image], description: book_params[:description])
    choice_params = params[:meeting][:choice_attributes]
    @choice = Choice.find_by_meeting_id(params[:id]) || Choice.create(book_id: @book.id, meeting_id: @meeting.id, selected: choice_params[:selected], category: choice_params[:category])
    if @choice.update(book_id: @book.id)
      flash[:notice] = ""
      redirect_to club_meeting_path
    else
      flash[:alert] = "Error updating meeting! Please complete all form fields."
      redirect_to edit_club_meeting_path
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to club_path(@meeting.club_id)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:datetime, :host, :street, :city, :state, :zip, :comment, :club_id, :book_attributes => {}, :choice_attributes => {})

  end

  # def book_params
  #   params.require(:book).permit(:title, :author, :image, :description)
  # end


end
