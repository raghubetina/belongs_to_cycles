class FirstsController < ApplicationController
  before_action :set_first, only: %i[show edit update destroy]

  def index
    @q = First.ransack(params[:q])
    @firsts = @q.result(distinct: true).includes(:seconds,
                                                 :third).page(params[:page]).per(10)
  end

  def show
    @second = Second.new
  end

  def new
    @first = First.new
  end

  def edit; end

  def create
    @first = First.new(first_params)

    if @first.save
      message = "First was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @first, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @first.update(first_params)
      redirect_to @first, notice: "First was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @first.destroy
    message = "First was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to firsts_url, notice: message
    end
  end

  private

  def set_first
    @first = First.find(params[:id])
  end

  def first_params
    params.require(:first).permit(:third_id)
  end
end
