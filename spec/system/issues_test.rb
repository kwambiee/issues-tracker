require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before do
    assign(:projects, [
      create(:project, title: "Project 1"),
      create(:project, title: "Project 2")
    ])
    render
  end

  it "displays all projects" do
    expect(rendered).to include("Project 1")
    expect(rendered).to include("Project 2")
  end

  it "has a link to create new project" do
    expect(rendered).to have_link("New Project", href: new_project_path)
  end
end