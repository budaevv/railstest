class BooksController < ApplicationController

  #http_basic_authenticate_with name: "admin", password: "password", only: :destroy

  def index
    @books = Book.all
  end

  def create
    @author = Author.find(params[:author_id])
    @comment = @author.books.new(book_params)
    @author.books.save
    redirect_to author_path(@author)
  end

  def destroy
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
    @book.destroy
    redirect_to author_path(@author)
  end

  private
  def book_params
    params.require(:book).permit(:title, :year)
  end

end
