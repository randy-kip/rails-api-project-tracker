require "application_system_test_case"

class ViewersTest < ApplicationSystemTestCase
  setup do
    @viewer = viewers(:one)
  end

  test "visiting the index" do
    visit viewers_url
    assert_selector "h1", text: "Viewers"
  end

  test "should create viewer" do
    visit viewers_url
    click_on "New viewer"

    fill_in "Name", with: @viewer.name
    fill_in "Project", with: @viewer.project_id
    click_on "Create Viewer"

    assert_text "Viewer was successfully created"
    click_on "Back"
  end

  test "should update Viewer" do
    visit viewer_url(@viewer)
    click_on "Edit this viewer", match: :first

    fill_in "Name", with: @viewer.name
    fill_in "Project", with: @viewer.project_id
    click_on "Update Viewer"

    assert_text "Viewer was successfully updated"
    click_on "Back"
  end

  test "should destroy Viewer" do
    visit viewer_url(@viewer)
    click_on "Destroy this viewer", match: :first

    assert_text "Viewer was successfully destroyed"
  end
end
