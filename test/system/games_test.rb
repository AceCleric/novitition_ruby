require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "creating a Game" do
    visit games_url
    click_on "New Game"

    fill_in "First team", with: @game.first_team
    fill_in "Location", with: @game.location
    fill_in "Match date", with: @game.match_date
    fill_in "Score first team", with: @game.score_first_team
    fill_in "Score second team", with: @game.score_second_team
    fill_in "Second team", with: @game.second_team
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "updating a Game" do
    visit games_url
    click_on "Edit", match: :first

    fill_in "First team", with: @game.first_team
    fill_in "Location", with: @game.location
    fill_in "Match date", with: @game.match_date
    fill_in "Score first team", with: @game.score_first_team
    fill_in "Score second team", with: @game.score_second_team
    fill_in "Second team", with: @game.second_team
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "destroying a Game" do
    visit games_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game was successfully destroyed"
  end
end
