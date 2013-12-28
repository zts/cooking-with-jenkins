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

# Create jobs for the cookbooks we're testing
include_recipe "cooking-with-jenkins::define-jenkins-jobs"
