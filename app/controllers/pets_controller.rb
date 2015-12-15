class PetsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      flash[:success] = "Pet details saved."
      redirect_to pets_path
    else
      flash[:errors] = @pets.errors.full_messages.join(" | ")
      render :new
    end
  end

  def pet_params
    params.require(:pet).permit(
      :name_of_pet,
      :type_of_pet,
      :breed,
      :age,
      :weight,
      :date_of_last_visit
    )
  end

end
