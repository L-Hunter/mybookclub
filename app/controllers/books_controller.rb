class BooksController < ApplicationController
  def index
    @books = Book.all
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

  def book_params
    params.require(:book).permit(:title, :author, :image, :description)

  end

end
