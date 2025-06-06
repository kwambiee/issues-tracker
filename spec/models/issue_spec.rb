require 'rails_helper'

RSpec.describe Issue, type: :model do
  let(:issue) { build(:issue) }

  it "is valid with valid attributes" do
    expect(issue).to be_valid
  end

  it "is not valid without a title" do
    issue.title = nil
    expect(issue).not_to be_valid
  end

  it "belongs to a project" do
    expect(Issue.reflect_on_association(:project).macro).to eq(:belongs_to)
  end

  describe "enums" do
    it "defines correct values for status enum" do
      expect(Issue.statuses).to eq({
        "new" => "New",
        "in_progress" => "In Progress",
        "closed" => "Closed"
      })
    end
    it "defines correct values for priority enum" do
      expect(Issue.priorities).to eq({
        "low" => 1,
        "medium" => 3,
        "high" => 5
      })
    end
  end
end