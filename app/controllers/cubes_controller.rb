class CubesController < ApplicationController

  before_action :find_cube, only: [:show, :edit, :update, :destroy]

  def index 
    @cubes = Cube.all.sort_by{|cube| cube.id}
  end


  def new 
    @cube = Cube.new
  end


  def create
    attributes = params.require(:cube).permit(:size,:color,:weight,:material)
    @cube = Cube.create(attributes)
    if @cube.errors.empty?
      redirect_to cube_path(@cube) 
    else
      render "new" 
    end
  end


  def show 
    unless @cube 
      render plain: "Page not found", status: 404 
    end

  end


  def edit

  end


  def update
    attributes = params.require(:cube).permit(:size,:color,:weight,:material)
    @cube.update(attributes)
    if @cube.errors.empty?
      redirect_to cube_path(@cube) 
    else
      render "edit"
    end

  end


  def destroy
    @cube.destroy
    redirect_to action: "index" 
  end

  private

  def find_cube
    @cube = Cube.find(params[:id])
  rescue
    render plain: "Page not found", status: 404
  end


end