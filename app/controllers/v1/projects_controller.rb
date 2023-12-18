class ProjectsController < ApplicationController
    # http_basic_authenticate_with name: "racks", password: "hunnid"
    # before_action :set_project, only: %i[ show edit update destroy ]
    skip_before_action :verify_authenticity_token, :only => :create

    # GET /projects or /projects.json
    def index
      @projects = current_user.projects.paginate(:page => params[:page], :per_page => params[:per_page])
      .order('created_at ASC')
      
      respond_to do |format|
        format.html 
        format.json { @projects }
      end
    end

    # GET /projects/1 or /projects/1.json
    def show
    end

    # GET /projects/new
    def new
      @project = Project.new
    end

    # GET /projects/1/edit
    def edit
    end

    # POST /projects or /projects.json
    def create
      @project = current_user.projects.create!(project_params)
      json_response(@project, :created)
    end

    # def create
    #   @project = Project.new(project_params)

    #   respond_to do |format|
    #     if @project.save
    #       format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
    #       format.json { render :show, status: :created, location: @project }
    #     else
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @project.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # PATCH/PUT /projects/1 or /projects/1.json
    def update
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /projects/1 or /projects/1.json
    def destroy
      @project.destroy

      respond_to do |format|
        format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.permit(:title, :start_date, :end_date)
      end
end