module V1
  class ProjectsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :create

    def index
      @projects = current_user.projects.paginate(:page => params[:page], :per_page => params[:per_page])
      .order('created_at ASC')
      
      respond_to do |format|
        format.html 
        format.json { @projects }
      end
    end

    def create
      @project = current_user.projects.create!(project_params)
      json_response(@project, :created)
    end

    private

    # remove `created_by` from list of permitted parameters
    def project_params
      params.permit(:title, :start_date, :end_date)
    end
  end
end