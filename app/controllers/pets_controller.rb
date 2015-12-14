class PetsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @pets = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      flash[:success] = "Pet details saved."
      render :new
    else
      flash[:errors] = @pets.errors.full_messages.join(" | ")
      render :new
    end
  end
end
