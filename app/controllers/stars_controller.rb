class StarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resource, only: %i[destroy]

  def create
    @star = Star.new(user_id: @current_user.id, gnavi_shop_id: params[:gnavi_shop_id])

    respond_to do |format|
      if @star.save
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    @star.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def set_resource
    @star = Star.find(params[:id])
  end
end
