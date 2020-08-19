require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー" do
    it "名前とメールアドレスがあれは有効" do
      user = User.new(
        name: "太郎",
        email: "test@example.com",
        password: "password",
        )
      expect(user).to be_valid
    end
  end
end