class RoutinesController < ApplicationController
  def create
  @routine = Routine.new(routine_params)

  respond_to do |format|
    if @routine.save
      format.html { redirect_to root_url}
      format.json { render :show, status: :created, location: @routine }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @routine.errors, status: :unprocessable_entity }
    end
  end
end

private
def routine_params
  params.require(:routine).permit( :routine_select)
end
end
