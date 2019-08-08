class ShopsController < ApplicationController
  
  
  def index
    @resouces = Gurunabi.fetch_gurunabi_api(1, 1, 1)
  end
end
    