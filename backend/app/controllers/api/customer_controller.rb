class Api::CustomerController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save!
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :uf)
  end
end
