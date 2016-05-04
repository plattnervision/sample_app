require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
   @base_title = "Eat brains"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
  # add contact page
  ## write test to get it and test for a success message
  ### create route for contact
  #### create static html page for contact
      # add title and provide statements

end
