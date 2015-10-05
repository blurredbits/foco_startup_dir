class OfficesController < ApplicationController

  before_action :set_office, only: [:show, :edit, :update, :destroy]

  def index
    @offices = Office.all
  end

  def show
  end

  def edit
  end

  def update
    if @office.update(office_params)
      flash[:notice] = "Office has been updated."
      redirect_to @office
    else
      flash.now[:alert] = "Office has not been updated."
      render "edit"
    end
  end

  private

  def set_office
    @office = Office.find(params[:id])
  rescue
    flash[:notice] = "The office you requested cannot be found."
    redirect_to offices_path
  end

  def office_params
    params.require(:office).permit(:name, :description, :location, :website)
  end
end
