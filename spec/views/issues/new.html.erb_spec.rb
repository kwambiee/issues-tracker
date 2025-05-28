require 'rails_helper'

RSpec.describe "issues/_form", type: :view do
  let(:project) { create(:project) }

  context "when rendering the new issue form" do
    let(:issue) { Issue.new }

    before do
      assign(:project, project)
      assign(:issue, issue)
      render partial: "issues/form", locals: { issue: issue }
    end

    it "renders the form with correct action" do
      expect(rendered).to have_selector("form")
    end

    it "has a title input field" do
      expect(rendered).to have_field("issue_title")
    end

    it "has a status select field" do
      expect(rendered).to have_select("issue_status", options: Issue.statuses.keys.map(&:humanize))
    end

    it "has a priority select field" do
      expect(rendered).to have_select("issue_priority", options: Issue.priorities.keys.map(&:humanize))
    end

    it "has a Cancel link to the project issues path" do
      expect(rendered).to have_link("Cancel", href: project_issues_path(project))
    end

    it "has a submit button" do
      expect(rendered).to have_selector("input[type='submit']")
    end
  end
end
