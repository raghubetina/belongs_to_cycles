class FirstsController < ApplicationController
  before_action :set_first, only: [:show, :edit, :update, :destroy]

  # GET /firsts
  def index
    @q = First.ransack(params[:q])
    @firsts = @q.result(:distinct => true).includes(:seconds, :third).page(params[:page]).per(10)
  end

  # GET /firsts/1
  def show
    @second = Second.new
  end

  # GET /firsts/new
  def new
    @first = First.new
  end

  # GET /firsts/1/edit
  def edit
  end

  # POST /firsts
  def create
    @first = First.new(first_params)

    if @first.save
      message = 'First was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @first, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /firsts/1
  def update
    if @first.update(first_params)
      redirect_to @first, notice: 'First was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /firsts/1
  def destroy
    @first.destroy
    message = "First was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to firsts_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first
      @first = First.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def first_params
      params.require(:first).permit(:third_id)
    end
end
