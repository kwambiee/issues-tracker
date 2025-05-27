require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:valid_attributes) { attributes_for(:project) }
  let(:invalid_attributes) { attributes_for(:project, title: nil) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, params: { project: valid_attributes }
        }.to change(Project, :count).by(1)
      end

      it "redirects to the created project" do
        post :create, params: { project: valid_attributes }
        expect(response).to redirect_to(Project.last)
      end
    end

    context "with invalid params" do
      it "does not create a new Project" do
        expect {
          post :create, params: { project: invalid_attributes }
        }.not_to change(Project, :count)
      end

      it "renders the new template" do
        post :create, params: { project: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end