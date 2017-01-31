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
  end

  private

  def choice_params
    params.require(:choice).permit(:book_id, :meeting_id, :selected, :category)
  end

end
