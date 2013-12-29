#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: install
#
# installs all of the stuff we'll be using
#
# Copyright (C) 2013 Zachary Stevens
# 
# All rights reserved - Do Not Redistribute
#

# First, make sure apt-update gets run
include_recipe "apt"

# We'll be pulling code using git
include_recipe "git::default"

# We'll need a ruby to run cookbook tests, and some of the gems we'll
# be installing need a few dev packages installed
ruby_packages = %w{ ruby1.9.3 rake bundler libxml2-dev libxslt-dev }
ruby_packages.each { |p| package p }

gems = %w{ foodcritic chefspec berkshelf test-kitchen kitchen-docker }
gems.each { |g| gem_package g }

# We'll be running cookbook integration tests under Docker
include_recipe "docker"

# Finally, install jenkins
include_recipe "jenkins::server"

