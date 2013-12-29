#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: define-jenkins-jobs
#
# Adds jobs in Jenkins for testing our cookbooks
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
