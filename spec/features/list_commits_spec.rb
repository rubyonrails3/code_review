require 'rails_helper'

RSpec.feature "ListCommits", type: :feature do
  describe 'list page' do
    it 'should see commits header on the page' do
      visit '/repo/commits'
      expect(page).to have_content('Project Commits')
    end
  end
end
