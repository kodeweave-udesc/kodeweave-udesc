require 'rails_helper'

RSpec.describe "projects/tasks/show", type: :view do
  before(:each) do
    @project_task = assign(:project_task, Projects::Task.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
