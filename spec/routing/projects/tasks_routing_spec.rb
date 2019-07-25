require "rails_helper"

RSpec.describe Projects::TasksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/projects/tasks").to route_to("projects/tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/projects/tasks/new").to route_to("projects/tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/projects/tasks/1").to route_to("projects/tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/projects/tasks/1/edit").to route_to("projects/tasks#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/projects/tasks").to route_to("projects/tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/projects/tasks/1").to route_to("projects/tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/projects/tasks/1").to route_to("projects/tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/projects/tasks/1").to route_to("projects/tasks#destroy", :id => "1")
    end
  end
end
