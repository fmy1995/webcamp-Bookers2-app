class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @books = Book.page(params[:page]).reverse_order  
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to books_path
    end
  end

  def show
  end

  def destroy
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
