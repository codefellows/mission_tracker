class MissionsController < ApplicationController
  # GET /missions
  # GET /missions.json
  def index
    @missions = Mission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @missions }
    end
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
    @mission = Mission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mission }
    end
  end

  # GET /missions/new
  # GET /missions/new.json
  def new
    @mission = Mission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mission }
    end
  end

  # GET /missions/1/edit
  def edit
    @mission = Mission.find(params[:id])
  end

  # POST /missions
  # POST /missions.json
  def create

    @mission = Mission.new(name: params[:mission][:name], objective: params[:mission][:objective])
    @mission.captain=Captain.find_by_id(params[:mission][:captain_id])
    @mission.crew=Crew.find_by_id(params[:mission][:crew_id])

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, notice: 'Mission was successfully created.' }
        format.json { render json: @mission, status: :created, location: @mission }
      else
        format.html { render action: "new" }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /missions/1
  # PUT /missions/1.json
  def update
    @mission = Mission.find(params[:id])
    @mission.name = params[:mission][:name]
    @mission.objective = params[:mission][:objective]
    @mission.captain_id = params[:mission][:captain_id]
    @mission.crew_id = params[:mission][:crew_id]

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, notice: 'Mission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy

    respond_to do |format|
      format.html { redirect_to missions_url }
      format.json { head :no_content }
    end
  end
end
