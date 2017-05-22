class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    # raise params.to_s
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Работник создан.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    # raise params.to_s
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Работник обновлен.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to workers_url, notice: 'Работник удален.' }
      format.json { head :no_content }
    end
  end

  def departament_fields
    id = params[:departament_id].to_i
    if id > 0
      @departament = Departament.find(id)
    else
      @departament = nil
    end
    # raise @departament.inspect
    respond_to do |format|
      format.js
    end
  end

  def project_fields
    id = params[:project_id].to_i
    @project = Project.find(id)
    @timestamp = params[:timestamp].to_i
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:fn, :ln, :sn, :passport_num,
      :passport_ser, :birthday, :post, :departament_id,
      :departament_attributes => [:name, :id],
      project_worker_relations_attributes: [:_destroy, :project_id, :id,
        project_attributes: Project.attributes_names.map(&:to_sym).push(:_destroy)])
    end
end
