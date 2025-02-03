class Api::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /api/books
  def index
    binding.pry
    @books = Book.all
    render json: @books
  end

  # GET /api/books/:id
  def show
    render json: @book
  end

  # POST /api/books
  def create
    @book = Book.new(book_params)
    if @book.save!
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/books/:id
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

  private

  def set_book
    @book = book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_at)
  end
end
