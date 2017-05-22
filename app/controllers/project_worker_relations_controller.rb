class ProjectWorkerRelationsController < ApplicationController
  before_action :set_project_worker_relation, only: [:show, :edit, :update, :destroy]

  # GET /project_worker_relations
  # GET /project_worker_relations.json
  def index
    @project_worker_relations = ProjectWorkerRelation.all
  end

  # GET /project_worker_relations/1
  # GET /project_worker_relations/1.json
  def show
  end

  # GET /project_worker_relations/new
  def new
    @project_worker_relation = ProjectWorkerRelation.new
  end

  # GET /project_worker_relations/1/edit
  def edit
  end

  # POST /project_worker_relations
  # POST /project_worker_relations.json
  def create
    @project_worker_relation = ProjectWorkerRelation.new(project_worker_relation_params)

    respond_to do |format|
      if @project_worker_relation.save
        format.html { redirect_to @project_worker_relation, notice: 'Project worker relation was successfully created.' }
        format.json { render :show, status: :created, location: @project_worker_relation }
      else
        format.html { render :new }
        format.json { render json: @project_worker_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_worker_relations/1
  # PATCH/PUT /project_worker_relations/1.json
  def update
    respond_to do |format|
      if @project_worker_relation.update(project_worker_relation_params)
        format.html { redirect_to @project_worker_relation, notice: 'Project worker relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_worker_relation }
      else
        format.html { render :edit }
        format.json { render json: @project_worker_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_worker_relations/1
  # DELETE /project_worker_relations/1.json
  def destroy
    @project_worker_relation.destroy
    respond_to do |format|
      format.html { redirect_to project_worker_relations_url, notice: 'Project worker relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_worker_relation
      @project_worker_relation = ProjectWorkerRelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_worker_relation_params
      params.require(:project_worker_relation).permit(:project_id, :worker_id)
    end
end
