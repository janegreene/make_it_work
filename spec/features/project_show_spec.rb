require 'rails_helper'

RSpec.describe "Project Show Page" do
  describe "I see that project's name and material" do
    it "And I also see the theme of the challenge that this project belongs to" do
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      visit "/projects/#{lit_fit.id}"

      expect(page).to have_content(lit_fit.name)
      expect(page).to have_content(lit_fit.material)
      expect(page).to have_content(furniture_challenge.theme)
    end
  end
end
# User Story 1 of 3
# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
