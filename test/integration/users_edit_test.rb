require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "foo@invalid",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user) # asserts that the view we are on is users/edit
    name  = "Foo Bar" # new name
    email = "foo@bar.com" # new email
    patch user_path(@user), user: { name:  name, # the actual past request with new info
                                    email: email,
                                    password:              "", # not required on edits
                                    password_confirmation: "" }
    assert_not flash.empty? # the flash message should not be empty
    assert_redirected_to @user # should be redirected to @user
    @user.reload # reloads the user from db
    assert_equal name,  @user.name # name should euqal the @user.reload value
    assert_equal email, @user.email # email should equal the @user.reload value
  end
end
