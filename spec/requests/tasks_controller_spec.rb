require "uri"
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

  context "POST /tasks" do
    let(:valid_attributes) { {name: "New Task", description: "A new task"} }
    let(:invalid_attributes) { {name: ",", description: "bad"} }

    it "creates a new task and redirects to show page" do
      expect {
        post "/tasks", params: {task: valid_attributes}
      }.to change(Task, :count).by(1)
      # After creation Rails redirects to the new task's URL.
      expect(response.headers["Location"]).to match(%r{/tasks/\d+$})
    end

    it "does not create a task with invalid attributes" do
      expect {
        post "/tasks", params: {task: invalid_attributes}
      }.not_to change(Task, :count)
      expect(response).to have_http_status(:unprocessable_content)
    end
  end

  context "PATCH /tasks/:id" do
    let!(:task) { create(:task, name: "Old", description: "old desc") }
    let(:valid_params) { {name: "Updated", description: "new desc"} }
    let(:invalid_params) { {name: ",", description: "bad"} }

    it "updates a task and redirects to show page" do
      patch "/tasks/#{task.id}", params: {task: valid_params}
      # The location header contains a full URL; compare only the path part.
      uri = URI.parse(response.headers["Location"])
      expect(uri.path).to eq("/tasks/#{task.id}")
      get response.headers["Location"]
      expect(response.body).to include("Updated")
    end

    it "does not update a task with invalid attributes" do
      patch "/tasks/#{task.id}", params: {task: invalid_params}
      expect(response).to have_http_status(:unprocessable_content)
      # Ensure data unchanged
      expect(task.reload.name).to eq("Old")
    end
  end

  context "DELETE /tasks/:id" do
    let!(:task) { create(:task, name: "DeleteMe") }

    it "deletes the task and redirects to index" do
      expect {
        delete "/tasks/#{task.id}"
      }.to change(Task, :count).by(-1)
      expect(response).to redirect_to(tasks_url)
    end
  end
end
