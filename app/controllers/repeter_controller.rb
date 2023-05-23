class RepeterController < ApplicationController
  def new
  end
  def create
    @number = Repeter.new(repeter_params)
    if @number.save
      redirect_to new_trainer_path
  end
end
