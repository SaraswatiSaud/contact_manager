class PhoneNumbersController < ApplicationController
  def create
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.create(phone_number_params)
    redirect_to person_path(@person)
  end

  def edit
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.find(params[:id])
  end

  def update
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.find(params[:id])

    if @phone_number.update(phone_number_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  def show
    @person = Person.find(params[:person_id])
    @phone_number = PhoneNumber.find(params[:id])
  end

  def destroy
    @person = Person.find(params[:person_id])
    @phone_number = PhoneNumber.find(params[:id])
    @phone_number.destroy
    redirect_to person_path(@person)
  end

  private
  def phone_number_params
    params.require(:phone_number).permit(:number)
  end
end
