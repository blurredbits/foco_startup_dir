class Admin::AnnouncementsController < Admin::ApplicationController

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.creator = current_user

    if @announcement.save
      flash[:notice] = "Announcement has been created."
      redirect_to @announcement
    else
      flash.now[:alert] = "Announcement has not been created."
      render "new"
    end
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

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    flash[:notice] = "Announcement has been deleted."
    redirect_to announcements_path
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :description)
  end
end