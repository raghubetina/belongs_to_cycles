class SecondsController < ApplicationController
  before_action :set_second, only: [:show, :edit, :update, :destroy]

  # GET /seconds
  def index
    @q = Second.ransack(params[:q])
    @seconds = @q.result(:distinct => true).includes(:first, :thirds).page(params[:page]).per(10)
  end

  # GET /seconds/1
  def show
    @third = Third.new
  end

  # GET /seconds/new
  def new
    @second = Second.new
  end

  # GET /seconds/1/edit
  def edit
  end

  # POST /seconds
  def create
    @second = Second.new(second_params)

    if @second.save
      message = 'Second was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @second, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /seconds/1
  def update
    if @second.update(second_params)
      redirect_to @second, notice: 'Second was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /seconds/1
  def destroy
    @second.destroy
    message = "Second was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to seconds_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_second
      @second = Second.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def second_params
      params.require(:second).permit(:first_id)
    end
end
