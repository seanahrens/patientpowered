require "test_helper"

class IdeasControllerTest < ActionController::TestCase

  def idea
    @idea ||= ideas :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ideas)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Idea.count') do
      post :create, idea: { author_id: @idea.author_id, description: @idea.description, title: @idea.title, video_url: @idea.video_url }
    end

    assert_redirected_to idea_path(assigns(:idea))
  end

  def test_show
    get :show, id: idea
    assert_response :success
  end

  def test_edit
    get :edit, id: idea
    assert_response :success
  end

  def test_update
    put :update, id: idea, idea: { author_id: @idea.author_id, description: @idea.description, title: @idea.title, video_url: @idea.video_url }
    assert_redirected_to idea_path(assigns(:idea))
  end

  def test_destroy
    assert_difference('Idea.count', -1) do
      delete :destroy, id: idea
    end

    assert_redirected_to ideas_path
  end
end
