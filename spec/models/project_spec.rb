require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  it "is valid with valid attributes" do
    expect(project).to be_valid
  end

  it "is not valid without a title" do
    project.title = nil
    expect(project).not_to be_valid
  end

  it "has many issues" do
    expect(Project.reflect_on_association(:issues).macro).to eq(:has_many)
  end

  describe "scopes" do
    let!(:project_with_issues) { create(:project_with_issues) }
  
    it "returns projects with issues" do
      expect(Project.with_issues).to include(project_with_issues)
    end
  end
end