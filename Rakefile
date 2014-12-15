# encoding: utf-8

desc "Run Docker image"
task :run_docker do
  sh 'docker run --name huboard -P --cidfile="cid" -t joshuacox/huboard'
end

desc "Exec bash in Docker image"
task :enter do
	sh 'docker exec -i -t `cat cid` /bin/bash'
end

desc "Build Docker image"
task :build_docker do
  sh 'docker build -t joshuacox/huboard .'
end

desc "build and run Docker container"
task :all => [:build_docker, :run_docker]

desc "default"
task :default => [:all]
