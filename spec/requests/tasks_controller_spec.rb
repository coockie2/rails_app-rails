# spec/requests/tasks_controller_spec.rb
require "rails_helper"

RSpec.describe "Tasks", type: :request do
  context "GET /tasks" do
    it "returns a successful response" do
      get "/tasks"
      expect(response).to have_http_status(:ok)
    end
  end

  context "GET /tasks/:id" do
    let(:task) { create(:task) }

    it "returns a successful response" do
      get "/tasks/#{task.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
