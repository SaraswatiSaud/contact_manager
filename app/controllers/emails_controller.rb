class EmailsController < ApplicationController
  def create
    @person = Person.find(params[:person_id])
    @email = @person.emails.create(email_params)
    redirect_to person_path(@person)
  end

  def edit
    @person = Person.find(params[:person_id])
    @email = @person.emails.find(params[:id])
  end

  def update
    @person = Person.find(params[:person_id])
    @email = @person.emails.find(params[:id])

    if @email.update(email_params)
      redirect_to person_path(@person)
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:person_id])
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to person_path(@person)
  end

  private
  def email_params
    params.require(:email).permit(:address)
  end
end
