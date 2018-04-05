class RecipiesController < ApplicationController
  before_action :load_current_user
  
  def index
    @recipies = @current_user.recipies
  end
  
  def create
    @recipie = @current_user.recipies.new(recipie_params)
    if @recipie.save
      render 'recipies/show'
    else
      render_errors(@recipie)
    end
  end
  
  def show
    @recipie = @current_user.recipies.find_by_id(params[:id])
    if @recipie
      render 'recipies/show'
    else
      not_found
    end
  end
  
  def update
    @recipie = @current_user.recipies.find_by_id(params[:id])
    if @recipie
      if @recipie.update_attributes(recipie_params)
        render 'recipies/show'
      else
        render_errors(@recipie)
      end
    else
      not_found
    end
  end
  
  def destroy
    @recipie = @current_user.recipies.find_by_id(params[:id])
    @recipie.destroy
    render json: {}, status: :ok
  end
  
  private
  def recipie_params
    params.require(:recipie).permit(:title, :ingredients, :description, :instruction, :link)
  end
end
