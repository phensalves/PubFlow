class Api::RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:show]

  def index
    @recommendations = Recommendation.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    if @recommendation.save!
      render json: @recommendation, status: :created
    else
      render json: @recommendation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:product_id, :customer_id, :description)
  end
end
