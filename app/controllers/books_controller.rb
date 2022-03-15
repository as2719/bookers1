class BooksController < ApplicationController
  def new
    @book =Book.new
  end

  def index
    @books =Book.all 
    @book =Book.new
  end

  def show
    @book =Book.find(params[:id])
  end

  def edit
    @book =Book.find(params[:id])
  end
  
  def update
    flash[:notice] = "successfully"
    @book =Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id)
    else
     render :edit
   end
  end
    
  def create
    flash[:notice] = "successfully"
    @books=Book.all
    @book =Book.new(book_params)
   if @book.save
    redirect_to book_path(@book.id)
   else
    render :index
   end 
  end
  
  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
 
end
