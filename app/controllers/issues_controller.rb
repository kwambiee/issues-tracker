class IssuesController < ApplicationController
  before_action :set_issue, only: %i[ show edit update destroy ]
  before_action :set_project, only: %i[ index show new create edit update destroy ]

  # GET /issues or /issues.json
  def index
    @issues = @project.issues

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
      format.xlsx { render xlsx: 'index', filename: "issues-#{Date.today}.xlsx" }
      format.pdf do
        render pdf: "issues-report-#{Date.today}",
              template: 'issues/index',
              layout: 'pdf',
              orientation: 'Landscape',
              page_size: 'A4'
      end
    end

  end

  # GET /issues/1 or /issues/1.json
  def show
  
  end

  # GET /projects/:project_id/issues/new(.:format
  def new
    @issue = @project.issues.build
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues or /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: "Issue was successfully created." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: "Issue was successfully updated." }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @project = @issue.project
    @issue.destroy!
  
    respond_to do |format|
      format.html { redirect_to project_issues_path(@project), status: :see_other, notice: "Issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def set_project
      @project = if params[:project_id]
                  Project.find(params[:project_id])
                  elsif @issue
                    @issue.project
                  end
    end

    def issue_params
      params.require(:issue).permit(:title, :description, :status, :priority, :project_id)
    end
end
