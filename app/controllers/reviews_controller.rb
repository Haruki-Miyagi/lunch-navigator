class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :new_resource, only: %i[new create]
  before_action :set_resource, only: %i[destroy]

  def new
    @review = Review.new(gnavi_shop_id: params[:gnavi_shop_id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @review.attributes = resource_params

    respond_to do |format|
      if @review.save
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def new_resource
    @review = Review.new(user_id: @current_user.id, score: 3)
  end

  def resource_params
    params.require(:review).permit(:comment, :gnavi_shop_id)
  end

  def set_resource
    @review = Review.find(params[:id])
  end
end
