#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: default
#
# Copyright (C) 2013 Zachary Stevens
# 
# All rights reserved - Do Not Redistribute
#

# Install everything
include_recipe "cooking-with-jenkins::install"

# Prepare docker for use under jenkins
include_recipe "cooking-with-jenkins::configure-docker"

# Prepare jenkins for running jobs
include_recipe "cooking-with-jenkins::configure-jenkins"

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
