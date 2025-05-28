require 'rails_helper'

RSpec.describe "issues/_issue", type: :view do
  let(:project) { create(:project, title: "Test Project") }
  let(:issue) do 
    create(:issue, 
      title: "Fix Login Bug", 
      status: "new", 
      priority: "high", 
      project: project
    )
  end

  before do
    render partial: "issues/issue", locals: { issue: issue }
  end

  it "displays the issue title with link" do
    expect(rendered).to have_link("Fix Login Bug", href: issue_path(issue))
  end

  it "displays the status with correct badge class" do
    expect(rendered).to include(issue.status.humanize)
    expect(rendered).to include(status_badge_class(issue.status))
  end

  it "displays the priority with correct badge class" do
    expect(rendered).to include(issue.priority.humanize)
    expect(rendered).to include(priority_badge_class(issue.priority))
  end

  it "displays the project title with link" do
    expect(rendered).to have_link("Test Project", href: project_path(project))
  end

  it "has an edit link" do
    expect(rendered).to have_link("Edit", href: edit_issue_path(issue))
  end

  it "has a delete button with confirmation" do
    expect(rendered).to have_selector("form[action='#{issue_path(issue)}'][method='post']")
    expect(rendered).to have_button("Delete")
    expect(rendered).to include('data-confirm="Are you sure?"')
  end
end
