require "spec_helper"

describe SeatsController do
  describe "routing" do

    it "routes to #index" do
      get("/seats").should route_to("seats#index")
    end

    it "routes to #new" do
      get("/seats/new").should route_to("seats#new")
    end

    it "routes to #show" do
      get("/seats/1").should route_to("seats#show", :id => "1")
    end

    it "routes to #edit" do
      get("/seats/1/edit").should route_to("seats#edit", :id => "1")
    end

    it "routes to #create" do
      post("/seats").should route_to("seats#create")
    end

    it "routes to #update" do
      put("/seats/1").should route_to("seats#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/seats/1").should route_to("seats#destroy", :id => "1")
    end

  end
end
