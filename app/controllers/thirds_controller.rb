class ThirdsController < ApplicationController
  before_action :set_third, only: [:show, :edit, :update, :destroy]

  # GET /thirds
  def index
    @thirds = Third.all
  end

  # GET /thirds/1
  def show
  end

  # GET /thirds/new
  def new
    @third = Third.new
  end

  # GET /thirds/1/edit
  def edit
  end

  # POST /thirds
  def create
    @third = Third.new(third_params)

    if @third.save
      redirect_to @third, notice: 'Third was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /thirds/1
  def update
    if @third.update(third_params)
      redirect_to @third, notice: 'Third was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /thirds/1
  def destroy
    @third.destroy
    redirect_to thirds_url, notice: 'Third was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third
      @third = Third.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def third_params
      params.require(:third).permit(:second_id)
    end
end
