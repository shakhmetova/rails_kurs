require 'test_helper'

class ProjectWorkerRelationsControllerTest < ActionController::TestCase
  setup do
    @project_worker_relation = project_worker_relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_worker_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_worker_relation" do
    assert_difference('ProjectWorkerRelation.count') do
      post :create, project_worker_relation: { project_id: @project_worker_relation.project_id, worker_id: @project_worker_relation.worker_id }
    end

    assert_redirected_to project_worker_relation_path(assigns(:project_worker_relation))
  end

  test "should show project_worker_relation" do
    get :show, id: @project_worker_relation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_worker_relation
    assert_response :success
  end

  test "should update project_worker_relation" do
    patch :update, id: @project_worker_relation, project_worker_relation: { project_id: @project_worker_relation.project_id, worker_id: @project_worker_relation.worker_id }
    assert_redirected_to project_worker_relation_path(assigns(:project_worker_relation))
  end

  test "should destroy project_worker_relation" do
    assert_difference('ProjectWorkerRelation.count', -1) do
      delete :destroy, id: @project_worker_relation
    end

    assert_redirected_to project_worker_relations_path
  end
end
