class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end

  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @user = User.find(current_user.id)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
    render :"books/index"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end

   def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
   end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
   end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end

