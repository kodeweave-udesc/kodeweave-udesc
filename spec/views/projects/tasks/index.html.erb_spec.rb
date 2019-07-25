require 'rails_helper'

RSpec.describe "projects/tasks/index", type: :view do
  before(:each) do
    assign(:project_tasks, [
      Projects::Task.create!(),
      Projects::Task.create!()
    ])
  end

  it "renders a list of projects/tasks" do
    render
  end
end
