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
      expect(response).to redirect_to(issues_url)
    end
  end

    describe "GET #index" do
    let!(:issue) { create(:issue) }

    it "responds to HTML" do
      get :index
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end

    it "responds to XLSX" do
      get :index, format: :xlsx
      expect(response.content_type).to eq('application/xlsx')
      expect(response.headers['Content-Disposition']).to include('issues-')
    end

    it "responds to PDF" do
      get :index, format: :pdf
      expect(response.content_type).to eq('application/pdf')
      expect(response.headers['Content-Disposition']).to include('issues-report-')
    end
  end
end