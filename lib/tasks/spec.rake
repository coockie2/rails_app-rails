task :spec do
  sh "rake spec", verbose: false
  sh "bundle exec rspec", verbose: false
end
