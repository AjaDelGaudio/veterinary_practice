class DoctorsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @doctors = Doctor.all
  end
end
