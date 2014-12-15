# encoding: utf-8

desc "Run Docker image"
task :run_docker do
  sh 'docker run -i -P -t joshuacox/huboard'
end

desc "Build Docker image"
task :build_docker do
  sh 'docker build -t joshuacox/huboard .'
end


desc "build and run Docker container"
task :all => [:build_docker, :run_docker]

