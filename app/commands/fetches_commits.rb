class FetchesCommits < Struct.new(:services)

  def fetch(params: {})
    response =  Net::HTTP.get_response(URI("#{repo_link}/commits"))
    JSON.parse(response.body)
  end

  private

  def repo_link
    'https://api.github.com/repos/rubyonrails3/code_review'
  end
end
