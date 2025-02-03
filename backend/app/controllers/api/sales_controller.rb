class Api::SalesController < ApplicationController
  before_action :set_sale, only: [:show]

  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save!
      render json: @sale, status: :created
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end
end
