FactoryBot.define do
    factory :project do
      title { Faker::App.name }
      description { Faker::Lorem.paragraph }
    end
  
    factory :issue do
      title { Faker::Lorem.sentence }
      status { "new" }
      priority { "low" }
      association :project
    end
  
    factory :project_with_issues, parent: :project do
      transient do
        issues_count { 3 }
      end
  
      after(:create) do |project, evaluator|
        create_list(:issue, evaluator.issues_count, project: project)
      end
    end
  end