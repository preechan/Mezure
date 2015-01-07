class KpisController < ApplicationController
  before_action :set_kpi, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @kpis = Kpi.all
    respond_with(@kpis)
  end

  def show
    respond_with(@kpi)
  end

  def new
    @kpi = Kpi.new
    respond_with(@kpi)
  end

  def edit
  end

  def create
    @kpi = Kpi.new(kpi_params)
    @kpi.save
    respond_with(@kpi)
  end

  def update
    @kpi.update(kpi_params)
    respond_with(@kpi)
  end

  def destroy
    @kpi.destroy
    respond_with(@kpi)
  end

  private
    def set_kpi
      @kpi = Kpi.find(params[:id])
    end

    def kpi_params
      params.require(:kpi).permit(:title, :description, :weighting, :baseline, :target)
    end
end
