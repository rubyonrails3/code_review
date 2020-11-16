Rails.application.routes.draw do

  get 'repo/commits' => 'repositories#commits', as: :commits
end
