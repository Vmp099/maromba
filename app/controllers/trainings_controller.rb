class TrainingsController < ApplicationController
  before_action :authenticate_user!
  require 'will_paginate/array'

  def index
    @q = User.ransack(params[:query])
    @user_finder = @q.result
    @user_finder = @user_finder.paginate(page: params[:page], per_page: 10).order('username asc')
    @trainings  = Training.all
    @current_weigth = Weigth.order(created_at: :desc)
    @training_id = Training.order(created_at: :desc).last
    @length_weigth = 0
    if Weigth.all.length != 0
      Weigth.where(training_id: @training_id.id).each do
        @length_weigth += 1
      end
    end
  end

  def show
    @training = Training.where(user_id: current_user).map
    @current_weigth = Weigth.order(created_at: :desc)
    @training_id = Training.order(created_at: :desc).last
    @length_weigth = 0
    if !Weigth.all.length == 0
      Weigth.where(training_id: @training_id.id).each do
        @length_weigth += 1
      end
    end
  end

  def new
    @training = Training.new
  end

  def edit
    @training  = Training.find(params[:id])
  end

  def create
    @training = Training.new(training_params)
    @training.save
    respond_to do |format|
      if @training.save
        format.html { redirect_to trainings_looper_url, notice: "Treino salvo com sucesso!" }
        format.json { render :index, status: :ok, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @training = Training.find(params[:id])
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to trainings_path, notice: "Treino modificado com sucesso!" }
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
    @weigth = Weigth.all
    respond_to do |format|
        @weigth.destroy_by(training_id: @training.id) if !@weigth.nil?
      @training.destroy
      format.html { redirect_to trainings_path, notice: "Treino deletado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit( :user_id,  :weigth, :name_training)
    end

end
