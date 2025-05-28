require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  let(:project) { create(:project, title: "Awesome Project", description: "A very long description that should be truncated in the view to show only a part of it.") }

  before do
    assign(:projects, [project]) # if your view expects @projects
    render "projects/project", project: project
  end

  it "displays the project title as a link" do
    expect(rendered).to have_link("Awesome Project", href: project_path(project))
  end

  it "displays the truncated project description" do
    expect(rendered).to include(truncate(project.description, length: 100))
  end

  it "has a link to view issues" do
    expect(rendered).to have_link("View Issues", href: project_issues_path(project))
  end

  it "has a link to edit the project" do
    expect(rendered).to have_link("Edit", href: edit_project_path(project))
  end

  it "has a button to delete the project with confirmation" do
    expect(rendered).to have_selector("form[action='#{project_path(project)}'][method='post']")
    expect(rendered).to have_button("Delete")
    expect(rendered).to include('data-confirm="Are you sure?"')
  end
end