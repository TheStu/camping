require 'test_helper'

class GearsControllerTest < ActionController::TestCase
  setup do
    @gear = gears(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gears)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gear" do
    assert_difference('Gear.count') do
      post :create, gear: { access: @gear.access, add_warmth: @gear.add_warmth, blade_length: @gear.blade_length, bug_proof: @gear.bug_proof, canopy: @gear.canopy, capacity: @gear.capacity, category_id: @gear.category_id, deck_material: @gear.deck_material, declination: @gear.declination, fixed_length: @gear.fixed_length, frame: @gear.frame, frame_material: @gear.frame_material, gear_type: @gear.gear_type, gender: @gear.gender, global_needle: @gear.global_needle, heel_lift: @gear.heel_lift, hip_strap: @gear.hip_strap, hood: @gear.hood, insulation: @gear.insulation, is_api_searchable: @gear.is_api_searchable, length: @gear.length, life_time: @gear.life_time, material: @gear.material, max_battery: @gear.max_battery, max_distance: @gear.max_distance, max_load: @gear.max_load, max_output: @gear.max_output, min_temp: @gear.min_temp, multi-tool: @gear.multi-tool, name: @gear.name, non-stick: @gear.non-stick, poncho: @gear.poncho, quilt: @gear.quilt, r_value: @gear.r_value, rainfly: @gear.rainfly, rechargeable: @gear.rechargeable, red_light: @gear.red_light, season: @gear.season, shape: @gear.shape, sighting_mirror: @gear.sighting_mirror, staff: @gear.staff, thickness: @gear.thickness, upper_material: @gear.upper_material, waterproof: @gear.waterproof, weight: @gear.weight }
    end

    assert_redirected_to gear_path(assigns(:gear))
  end

  test "should show gear" do
    get :show, id: @gear
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gear
    assert_response :success
  end

  test "should update gear" do
    patch :update, id: @gear, gear: { access: @gear.access, add_warmth: @gear.add_warmth, blade_length: @gear.blade_length, bug_proof: @gear.bug_proof, canopy: @gear.canopy, capacity: @gear.capacity, category_id: @gear.category_id, deck_material: @gear.deck_material, declination: @gear.declination, fixed_length: @gear.fixed_length, frame: @gear.frame, frame_material: @gear.frame_material, gear_type: @gear.gear_type, gender: @gear.gender, global_needle: @gear.global_needle, heel_lift: @gear.heel_lift, hip_strap: @gear.hip_strap, hood: @gear.hood, insulation: @gear.insulation, is_api_searchable: @gear.is_api_searchable, length: @gear.length, life_time: @gear.life_time, material: @gear.material, max_battery: @gear.max_battery, max_distance: @gear.max_distance, max_load: @gear.max_load, max_output: @gear.max_output, min_temp: @gear.min_temp, multi-tool: @gear.multi-tool, name: @gear.name, non-stick: @gear.non-stick, poncho: @gear.poncho, quilt: @gear.quilt, r_value: @gear.r_value, rainfly: @gear.rainfly, rechargeable: @gear.rechargeable, red_light: @gear.red_light, season: @gear.season, shape: @gear.shape, sighting_mirror: @gear.sighting_mirror, staff: @gear.staff, thickness: @gear.thickness, upper_material: @gear.upper_material, waterproof: @gear.waterproof, weight: @gear.weight }
    assert_redirected_to gear_path(assigns(:gear))
  end

  test "should destroy gear" do
    assert_difference('Gear.count', -1) do
      delete :destroy, id: @gear
    end

    assert_redirected_to gears_path
  end
end
