class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, except: [:show]
  load_and_authorize_resource

  # GET /gears
  # GET /gears.json
  def index
    @gears = Gear.all
  end

  # GET /gears/1
  # GET /gears/1.json
  def show
  end

  # GET /gears/new
  def new
    @gear = Gear.new
  end

  # GET /gears/1/edit
  def edit
  end

  # POST /gears
  # POST /gears.json
  def create
    @gear = Gear.new(gear_params)

    respond_to do |format|
      if @gear.save
        format.html { redirect_to @gear, notice: 'Gear was successfully created.' }
        format.json { render :show, status: :created, location: @gear }
      else
        format.html { render :new }
        format.json { render json: @gear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gears/1
  # PATCH/PUT /gears/1.json
  def update
    respond_to do |format|
      if @gear.update(gear_params)
        format.html { redirect_to @gear, notice: 'Gear was successfully updated.' }
        format.json { render :show, status: :ok, location: @gear }
      else
        format.html { render :edit }
        format.json { render json: @gear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gears/1
  # DELETE /gears/1.json
  def destroy
    @gear.destroy
    respond_to do |format|
      format.html { redirect_to gears_url, notice: 'Gear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gear
      @gear = Gear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gear_params
      params.require(:gear).permit(:category_id, :name, :weight, :shape, :quilt, :min_temp, :hood, 
                                   :insulation, :season, :gear_type, :capacity, :hip_strap, :frame, 
                                   :access, :length, :thickness, :r_value, :waterproof, :bug_proof, 
                                   :life_time, :fixed_length, :staff, :poncho, :gender, :material, 
                                   :upper_material, :deck_material, :frame_material, :heel_lift, :max_load, 
                                   :canopy, :rainfly, :add_warmth, :non_stick, :blade_length, :multi_tool, 
                                   :declination, :sighting_mirror, :global_needle, :red_light, :max_output, 
                                   :max_distance, :max_battery, :rechargeable, :is_api_searchable)
    end
end
