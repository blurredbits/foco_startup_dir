class AnnouncementsController < ApplicationController

  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  def index
    @announcements = Announcement.all
  end

  def show
  end


  def edit
  end

  def update
    if @announcement.update(announcement_params)
      flash[:notice] = "Announcement has been updated."
      redirect_to @announcement
    else
      flash.now[:alert] = "Announcement has not been updated."
      render "edit"
    end
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  rescue
    flash[:alert] = "The announcement you were looking for could not be found."
    redirect_to announcements_path
  end

  def announcement_params
    params.require(:announcement).permit(:title, :description)
  end

end
