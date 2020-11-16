require 'rails_helper'

RSpec.feature "ListCommits", type: :feature do
  let(:commits) { JSON.parse(Rails.root.join("spec/fixtures/commits.json").read) }
  let(:commit) { commits.dig(0, 'commit') }
  describe 'list page' do
    it 'should see commits header on the page' do
      VCR.use_cassette("list_commits") do
        visit '/repo/commits'
        expect(page).to have_content('Project Commits')
      end
    end

    it 'should see repository commits on the page' do
      VCR.use_cassette("list_commits") do
        visit '/repo/commits'
        expect(page).to have_content(commit['message'])
      end
    end
  end
end
