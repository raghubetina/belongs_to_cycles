class SecondsController < ApplicationController
  before_action :set_second, only: %i[show edit update destroy]

  def index
    @q = Second.ransack(params[:q])
    @seconds = @q.result(distinct: true).includes(:first,
                                                  :thirds).page(params[:page]).per(10)
  end

  def show
    @third = Third.new
  end

  def new
    @second = Second.new
  end

  def edit; end

  def create
    @second = Second.new(second_params)

    if @second.save
      message = "Second was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @second, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @second.update(second_params)
      redirect_to @second, notice: "Second was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @second.destroy
    message = "Second was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to seconds_url, notice: message
    end
  end

  private

  def set_second
    @second = Second.find(params[:id])
  end

  def second_params
    params.require(:second).permit(:first_id)
  end
end
