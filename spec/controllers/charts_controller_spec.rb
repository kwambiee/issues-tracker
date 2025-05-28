require "rails_helper"


  RSpec.describe ChartsController, type: :controller do
    let(:project) { create(:project) }
    
    describe "GET #index" do
      before do
        create(:issue, status: "New", project: project)
        create(:issue, status: "Closed", project: project)
        create(:issue, status: "In Progress", project: project)
        get :index
      end

      it "is successful" do
        expect(response).to be_successful
      end

      it "assigns correct status data" do
        expect(assigns(:status_data)).to eq({
          "new" => 1,
          "in_progress" => 1,
          "closed" => 1
        })
      end

      it "assigns correct project data" do
        expect(assigns(:project_data)).to eq({ project.title => 3 })
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end
  end
end

