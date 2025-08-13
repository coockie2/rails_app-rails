require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  describe "GET /admin/users/new" do
    it "renders the new user form" do
      get new_admin_user_path
      expect(response).to have_http_status(:ok)
      # テンプレートで使っている文字列に合わせる
      expect(response.body).to include("ユーザー登録")
    end
  end

  describe "POST /admin/users" do
    subject do
      token = SecureRandom.base64(32)
      post admin_users_path, params: param_attributes, headers: { 'X-CSRF-Token' => token }
    end

    context "with valid parameters" do
      let(:param_attributes) do
        {
          user: {
            name:            "Alice",
            email:           "alice@example.com",
            admin:           false,
            password:        "password123",
            password_confirmation: "password123"
          }
        }
      end

      it "creates a new user and redirects to the user's show page" do
        expect { subject }.to change(User, :count).by(1)

        created_user = User.last
        expect(response).to redirect_to(admin_user_path(created_user))
        follow_redirect!
        expect(response.body).to include("ユーザー「#{created_user.name}」を登録しました")
      end
    end

    context "with invalid parameters" do
      let(:param_attributes) do
        {
          user: {
            name:            "",
            email:           "not-an-email",
            admin:           false,
            password:        "short",
            password_confirmation: "mismatch"
          }
        }
      end

      it "does not create a user and re-renders the new template" do
        expect { subject }.not_to change(User, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        # 新規テンプレートのタイトルを確認
        expect(response.body).to include("ユーザー登録")
      end
    end
  end
end
