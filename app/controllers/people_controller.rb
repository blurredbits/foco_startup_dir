class PeopleController < ApplicationController

  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def show
  end

  def edit
  end

  def update
    if @person.update(person_params)
      flash[:notice] = "Person has been updated."
      redirect_to @person
    else
      flash.now[:alert] = "Person has not been updated."
      render "edit"
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  rescue
    flash[:alert] = "The person you were looking for could not be found."
    redirect_to people_path
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :bio)
  end

end
