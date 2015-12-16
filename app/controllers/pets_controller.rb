class PetsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to @pet
      flash[:success] = "Pet details saved."
    else
      render :new
      flash[:errors] = @pet.errors.full_messages.join(" | ")
    end
  end

  private

  def pet_params
    params.require(:pet).permit(
      :name_of_pet,
      :type_of_pet,
      :breed,
      :age,
      :weight,
      :date_of_last_visit,
      :id
    )
  end
end
