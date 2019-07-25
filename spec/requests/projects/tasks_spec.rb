require 'rails_helper'

RSpec.describe "Projects::Tasks", type: :request do
  describe "GET /projects/tasks" do
    it "works! (now write some real specs)" do
      get project_tasks_path
      expect(response).to have_http_status(200)
    end
  end
end
