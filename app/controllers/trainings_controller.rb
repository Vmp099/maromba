class TrainingsController < ApplicationController
  before_action :authenticate_user!
  before_action :routine, only: [:new]

  def index
    @trainings = Training.all
    @current_weigth = Weigth.order(created_at: :desc)
  end

  def show
    @training = Training.where(user_id: current_user).map
    @current_weigth = Weigth.order(created_at: :desc)
  end

  def user
    @training = Training.where(user_id: current_user).map
    @current_weigth = Weigth.order(created_at: :desc)
  end

  def new
    @routine = Routine.find(params[:routine])
    @i = Routine.find(@routine.id).routine_select.length
  end

  def routine
    @routine = Routine.all
  end

  def edit
    @training  = Training.find(params[:id])
  end

  def create
    @i = Routine.find(training_params[:routine_id]).routine_select.length
    count = 0
    @i.times do
      @training_name = training_params[:name_training][count]
      @training_weigth = training_params[:weigth][count]
      @training = Training.new(user_id: training_params[:user_id], routine_id: training_params[:routine_id], name_training: @training_name, weigth: @training_weigth)
        count += 1
      @training.save
    end
    respond_to do |format|
      if @training.save
        format.html { redirect_to trainings_path, notice: "Treino salvo com sucesso!" }
        format.json { render :index, status: :ok, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    @training = Training.find(params[:id])
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to root_path, notice: "Treino modificado com sucesso!" }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @training = Training.find(params[:id])
  end
  # DELETE /companies/1 or /companies/1.json
  def destroy
    @training = Training.find(params[:id])
    @weigth = Weigth.find_by(training_id: @training.id)
    respond_to do |format|
      @weigth.destroy if !@weigth.nil?
      @training.destroy
      format.html { redirect_to training_user_path(current_user.id), notice: "Treino deletado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit( :user_id, :routine_id, :weigth => [], :name_training => [])
    end

end
