class Admin::PeopleController < Admin::ApplicationController

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    @person.creator = current_user

    if @person.save
      flash[:notice] = "Person has been created."
      redirect_to @person
    else
      flash.now[:alert] = "Person has not been created."
      render "new"
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    flash[:notice] = "Person has been deleted."
    redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :bio)
  end
end