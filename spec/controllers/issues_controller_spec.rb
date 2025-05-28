require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  let(:project) { create(:project) }
  let(:valid_attributes) { attributes_for(:issue, project_id: project.id) }
  let(:invalid_attributes) { attributes_for(:issue, title: nil) }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { project_id: project.id }
      expect(response).to be_successful
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested issue" do
      issue = create(:issue, project: project)
      expect {
        delete :destroy, params: { id: issue.id }
      }.to change(Issue, :count).by(-1)
    end

    it "redirects to the issues list" do
      issue = create(:issue, project: project)
      delete :destroy, params: { id: issue.id }
      expect(response).to redirect_to(project_issues_url(project))
    end
  end

  describe "GET #index" do
    before do
      create_list(:issue, 3, project: project)
    end

    it "responds to HTML" do
      get :index, params: { project_id: project.id }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it "responds to XLSX" do
      get :index, params: { project_id: project.id, format: :xlsx }
      expect(response.content_type).to eq 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      expect(response.headers['Content-Disposition']).to include("issues-#{Date.today}")
    end

    it "responds to PDF" do
      get :index, params: { project_id: project.id, format: :pdf }
      expect(response.content_type).to eq 'application/pdf'
      expect(response.headers['Content-Disposition']).to include("issues-report-#{Date.today}")
    end
  end
end