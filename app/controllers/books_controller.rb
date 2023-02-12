class BooksController < ApplicationController
  def new
    @book =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save!
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
    @books= Book.all
    render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.all
  end

  def edit
    @book =Book.find(params[:id])
    
  end
  
  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
    def book_params
      params.require(:book).permit(:title, :body, :image)
    end
  
end
