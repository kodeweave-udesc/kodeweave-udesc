require 'rails_helper'

RSpec.describe "projects/tasks/new", type: :view do
  before(:each) do
    assign(:project_task, Projects::Task.new())
  end

  it "renders new project_task form" do
    render

    assert_select "form[action=?][method=?]", project_tasks_path, "post" do
    end
  end
end
