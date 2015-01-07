class MetricsController < ApplicationController
  before_action :set_metric, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def select_metrics
    @metrics = Metric.where(:id => params[:metric_ids])
    @project = Project.find(params[:project_id])
    @project.metrics.destroy_all   #disassociate the already added organizers
    @project.metrics << @metrics
    @project.save
    redirect_to @project
  end

  def index
    @metrics = Metric.all
    @project = Project.find(params[:project_id])
    @metrics_projects = MetricsProjects.where('project_id' => params[:project_id])
    @selectedmetrics  = Array.new
    @metrics_projects.each do |ct|
          @selectedmetrics  << Metric.find(ct["metric_id"])
    end
    respond_with(@metrics)
  end

  def show
    respond_with(@metric)
  end

  def new
    @metric = Metric.new
    respond_with(@metric)
  end

  def edit
  end

  def create
    @metric = Metric.new(metric_params)
    @metric.save
    respond_with(@metric)
  end

  def update
    @metric.update(metric_params)
    respond_with(@metric)
  end

  def destroy
    @metric.destroy
    respond_with(@metric)
  end

  private
    def set_metric
      @metric = Metric.find(params[:id])
    end

    def metric_params
      params.require(:metric).permit(:name, :channel_id)
    end
end
