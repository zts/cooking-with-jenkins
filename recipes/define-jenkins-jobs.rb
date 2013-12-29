#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: define-jenkins-jobs
#
# Adds jobs in Jenkins for testing our cookbooks
#
# Copyright (C) 2013 Zachary Stevens
# 
# All rights reserved - Do Not Redistribute
#

# Create jenkins jobs for the cookbooks we want to test
cookbook_ci "managed_directory" do
  repository "https://github.com/zts/chef-cookbook-managed_directory.git"
  branch "master"
  foodcritic true
  chefspec true
  kitchen true
end

cookbook_ci "mcollective" do
  repository "https://github.com/zts/cookbook-mcollective.git"
  branch "master"
  foodcritic false
end

# test repo with foodcritic errors, and junit-format rspec output
cookbook_ci "test" do
  repository "https://github.com/zts/test-cookbook.git"
  branch "master"
  foodcritic true
  chefspec true
  kitchen false
  junit_results true
end
