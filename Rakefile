# encoding: utf-8

desc "build and run Docker container"
task :default => [:build_docker, :run_docker]

desc "default"
task :rm => [:kill, :rm_docker]

desc "Run Docker image"
task :run_docker do
  sh 'docker run --name huboard -P --cidfile="cid" -t whc/huboard'
end

desc "Exec bash in Docker image"
task :enter do
	sh 'docker exec -i -t `cat cid` /bin/bash'
end

desc "RM Docker image"
task :rm_docker do
	sh 'docker rm `cat cid`'
	sh 'rm cid'
end

desc "Kill Docker image"
task :kill do
	sh 'docker kill `cat cid`'
end

desc "Build Docker image"
task :build_docker do
  sh 'docker build -t whc/huboard .'
end
