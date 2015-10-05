class Admin::OfficesController < Admin::ApplicationController

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    @office.creator = current_user

    if @office.save
      flash[:notice] = "Office has been created."
      redirect_to @office
    else
      flash.now[:alert] = "Office has not been created."
      render "new"
    end
  end

  def destroy
    @office = Office.find(params[:id])
    @office.destroy

    flash[:notice] = "Office has been deleted."
    redirect_to offices_path
  end

  private

  def office_params
    params.require(:office).permit(:name, :description, :location, :website)
  end
  
end