require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before do
    assign(:project, Project.new)
    render
  end

  it "renders the form partial" do
    expect(rendered).to render_template(partial: '_form')
  end

  it "has the correct form fields" do
    expect(rendered).to have_field('Title')
    expect(rendered).to have_field('Description')
  end

  it "has a submit button" do
    expect(rendered).to have_button('Create Project')
  end

  it "has a cancel link" do
    expect(rendered).to have_link('Cancel', href: projects_path)
  end
end