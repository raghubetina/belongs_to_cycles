class ThirdsController < ApplicationController
  before_action :set_third, only: %i[show edit update destroy]

  def index
    @q = Third.ransack(params[:q])
    @thirds = @q.result(distinct: true).includes(:second,
                                                 :firsts).page(params[:page]).per(10)
  end

  def show
    @first = First.new
  end

  def new
    @third = Third.new
  end

  def edit; end

  def create
    @third = Third.new(third_params)

    if @third.save
      message = "Third was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @third, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @third.update(third_params)
      redirect_to @third, notice: "Third was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @third.destroy
    message = "Third was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to thirds_url, notice: message
    end
  end

  private

  def set_third
    @third = Third.find(params[:id])
  end

  def third_params
    params.require(:third).permit(:second_id)
  end
end
