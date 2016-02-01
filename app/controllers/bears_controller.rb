class BearsController < ApplicationController

  def index
    @bears = Bear.all
  end

  def show
    @bear = Bear.find(params[:id])
  end

  def new
    @bear = Bear.new
  end

  def create
    @bear = Bear.new(bear_params)
    if @bear.save
      flash[:success] = "Bear Created"
      redirect_to bear_path(@bear)
    else
      flash[:error] = "Bear Not Created"
      redirect_to new_bear_path
    end
  end

  def edit
    @bear = Bear.find(params[:id])
  end

  def update
    @bear = Bear.find(params[:id])
    if @bear.update(bear_params)
      flash[:success] = "Bear Updated"
      redirect_to bears_path
    else
      flash[:error] = "Bear Not Updated"
      redirect_to edit_bear_path(@bear)
    end
  end

  def destroy
    @bear = Bear.find(params[:id])
    if @bear.destroy
      flash[:success] = "Bear Destroyed"
      redirect_to bears_path
    else
      flash[:error] = "Bear Not Destroyed"
      redirect_to bear_path(@bear)
    end
  end

  private
    def bear_params
      params.require(:bear).permit(:name, :description)
    end
end
