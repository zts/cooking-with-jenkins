#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: default
#
# Copyright (C) 2013 Zachary Stevens
# 
# All rights reserved - Do Not Redistribute
#

# Install jenkins
include_recipe "apt"
include_recipe "jenkins::server"

# Install git, and related Jenkins plugins
include_recipe "git::default"
jenkins_plugin "scm-api"
jenkins_plugin "git-client"
jenkins_plugin "git"

# Install ruby, for running cookbook tests
ruby_packages = %w{ ruby1.9.3 rake bundler libxml2-dev libxslt-dev }
ruby_packages.each { |p| package p }

# Install docker, for running cookbook integration tests
include_recipe "docker"

# add jenkins to the docker group, so that it doesn't need sudo
group "docker" do
  members "jenkins"
  append true
  action :modify
  notifies :restart, "service[docker]"
end

# pull down the images we'll use for testing
docker_image "centos"


# Add Jenkins job for a repository
repo = "https://github.com/zts/chef-cookbook-managed_directory.git"
job_name = "cookbook-managed_directory"
job_config = File.join(node[:jenkins][:server][:home], "#{job_name}-config.xml")

jenkins_job job_name do
  action :nothing
  config job_config
end

template job_config do
  source 'cookbook-job.xml.erb'
  variables :git_url => repo, :git_branch => 'master'
  notifies  :update, "jenkins_job[#{job_name}]", :immediately
  notifies  :build, "jenkins_job[#{job_name}]", :immediately
end
