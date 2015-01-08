class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
        @channels_projects = ChannelsProjects.where('project_id' => params[:id])
        @channels = Array.new
        @channels_projects.each do |cp|
          @channels  << Channel.find(cp["channel_id"])
        end

        @metrics_projects = MetricsProjects.where('project_id' => params[:id])
        @metrics = Array.new
        @metrics_projects.each do |cp|
          @metrics  << Metric.find(cp["metric_id"])
        end
  end

  # GET /projects/new
  def new
    @project = Project.new
    @channels = Channel.all
     @selectedchannels = Array.new
  end

  # GET /projects/1/edit
  def edit
    @channels = Channel.all
    @channels_projects = ChannelsProjects.where('project_id' => params[:id])
    @selectedchannels = Array.new
    @channels_projects.each do |ct|
          @selectedchannels  << Channel.find(ct["channel_id"])
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
  @channels = Channel.where(:id => params[:channel_id])
    @project.channels << @channels 
    respond_to do |format|
      if @project.save
        format.html { redirect_to metrics_path("project_id" => @project.id), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
      @project = Project.find(params[:id])
      @channels = Channel.where(:id => params[:channel_id])
      @project.channels.destroy_all   #disassociate the already added organizers
      @project.channels << @channels 
      #associate the selected organizers to the event and create records in the join table
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to metrics_path("project_id" => @project.id), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :startdate, :enddate, :status,:keyword)
    end
end
