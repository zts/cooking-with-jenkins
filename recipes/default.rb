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
