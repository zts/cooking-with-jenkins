#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: configure-docker
#
# Prepares docker for running integration tests under jenkins
#
# Copyright (C) 2013 Zachary Stevens
# 
# All rights reserved - Do Not Redistribute
#

# add jenkins to the docker group, so that it doesn't need to use
# sudo.  Alternatively, we could configure sudo such that jenkins can
# run "docker" without a password.
group "docker" do
  members "jenkins"
  append true
  action :modify
  notifies :restart, "service[docker]"
end

# Download the images we'll be using with test-kitchen.
docker_image "centos"

