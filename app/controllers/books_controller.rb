class BooksController < ApplicationController
  def new
    @book =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
    @user = current_user
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
    @book = Book.new
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.all
  end

  def edit
    @book =Book.find(params[:id])
    
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] ="You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    @books= Book.all
    render :edit
    end
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
    
    def is_matching_login_user
       user_id = params[:id].to_i
       unless user_id == current_user.id
         redirect_to book_path
       end
    end
 
  
end
