class SpicesController < ApplicationController

  def index
    spices = Spice.all 
    render json: spices
  end 

  
  #def show
    #spice = find_spice
    #render json: spice
  #rescue ActiveRecord::RecordNotFound 
   # render_not_found_error
  #end 

  def create 
    spice = Spice.create(allow_params)
    render json: spice, status: :created
  end 

  def update
    spice = find_spice
    spice.update(allow_params)
    render json: spice
  rescue ActiveRecord::RecordNotFound 
    render_not_found_error
  end 

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound 
    render_not_found_error
  end 

  private

  def find_spice
    Spice.find_by(id: params[:id])
  end 

  def allow_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_not_found_error
    render json: { error: "Spice not found"}, status: :not_found
  end 

end
