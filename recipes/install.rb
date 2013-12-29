#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: install
#
# installs all of the stuff we'll be using
#
# Copyright (C) 2013 Zachary Stevens
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# First, make sure apt-update gets run
include_recipe "apt"

# We'll be pulling code using git
include_recipe "git::default"

# We'll need a ruby to run cookbook tests, and some of the gems we'll
# be installing need a few dev packages installed
ruby_packages = %w{ ruby1.9.3 rake bundler libxml2-dev libxslt-dev }
ruby_packages.each { |p| package p }

# We'll be running cookbook integration tests under Docker
include_recipe "docker"

# Finally, install jenkins
include_recipe "jenkins::server"

