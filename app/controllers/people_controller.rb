class PeopleController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_person, :authorize_user!, only: [:edit, :update, :destroy]

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def index
    @people = Person.all.order(id: :desc)
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_path
  end

  private
  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def authorize_user!
    unless current_user.id == @person.user_id
      flash[:notice] = 'You are not authorized for this action'
      redirect_to people_path
    end
  end
end
