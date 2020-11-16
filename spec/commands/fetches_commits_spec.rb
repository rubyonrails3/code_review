require 'rails_helper'

RSpec.describe FetchesCommits do
  subject { FetchesCommits.new services }
  let(:uri) {  URI('https://api.github.com/repos/rubyonrails3/code_review/commits') }
  let(:response) { double '#<Net::HTTPOK 200 OK readbody=true>' }
  let(:json) { Rails.root.join("spec/fixtures/commits.json").read }
  let(:services) {
    {}
  }
  it 'fetches commits from the repository' do
    expect(Net::HTTP).to receive(:get_response).with(uri) { response }
    expect(response).to receive(:body) { json }
    expect(JSON).to receive(:parse).with(json)
    subject.fetch params: {}
  end
end
