class PhoneNumbersController < ApplicationController
  def create
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.create(phone_number_params)
    redirect_to person_path(@person)
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
