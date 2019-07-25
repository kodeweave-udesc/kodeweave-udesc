require 'rails_helper'

RSpec.describe "projects/tasks/edit", type: :view do
  before(:each) do
    @project_task = assign(:project_task, Projects::Task.create!())
  end

  it "renders the edit project_task form" do
    render

    assert_select "form[action=?][method=?]", project_task_path(@project_task), "post" do
    end
  end
end
