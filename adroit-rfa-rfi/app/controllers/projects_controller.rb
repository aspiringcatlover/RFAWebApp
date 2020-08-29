class ProjectsController < ApplicationController
     def index
      @projects = Project.all
    end


    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])

        @project.update(project_params)
        redirect_to action: "index"
    end


    def show
        @project = Project.find(params[:id])
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to action: "index"
    end

     # Only allow a list of trusted parameters through.
    private
    def project_params
      params.require(:project).permit(:title, :company)
    end

end
