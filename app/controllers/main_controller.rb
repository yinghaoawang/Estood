class MainController < ApplicationController
  layout 'application'
  def index
    @users = User.by_created_at
  end
  #experimental, dev
  def dev_new
    @user_pass = Faker::Internet.domain_word
    @user = User.create(name: Faker::Superhero.name) do |doc|
      doc.email = Faker::Internet.free_email
      doc.password_hash = BCrypt::Password.create(@user_pass)
      doc.about = Faker::Hipster.sentence(3, false, 4)
      doc.page_name = Faker::App.name
    end
  end
end
