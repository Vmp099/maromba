class MeasuresController < ApplicationController

  def index
    @measures = Measure.order(user_id: :desc)
    @current_measure = CurrentMeasure.order(created_at: :desc)
  end
  def show
    @measures = Measure.where(user_id: current_user.id).map
    @current_measure = CurrentMeasure.order(created_at: :desc)
  end

  def new
    @measure = Measure.new
  end
  def edit
    @measure = Measure.find(params[:id])
  end


  def update
    @measure = Measure.find(params[:id])
    respond_to do |format|
      if @measure.update(measure_params)
        format.html { redirect_to measure_path(current_user.id), notice: "Medida modificada com sucesso!" }
        format.json { render :show, status: :ok, location: @measure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @measure = Measure.find(params[:id])
  end

  def destroy
    @measure = Measure.find(params[:id])
    @current_measure = CurrentMeasure.all
    respond_to do |format|
        @current_measure.destroy_by(measure_id: @measure.id) if !@current_measure.nil?

      @measure.destroy
      format.html { redirect_to measure_path(current_user.id), notice: "Medida deletada com sucesso!" }
      format.json { head :no_content }
    end
  end

  def create
    @measure = Measure.new(measure_params)

    respond_to do |format|
      if @measure.save
        format.html { redirect_to measures_url}
        format.json { render :show, status: :created, location: @measure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def measure_params
    params.require(:measure).permit( :new_measure, :name_muscle, :user_id)
  end

end
