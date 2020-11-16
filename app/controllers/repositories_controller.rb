class RepositoriesController < ApplicationController

  def commits
    commits = FetchesCommits.new({}).fetch
    render action: :commits, locals: { commits: commits }
  end
end
