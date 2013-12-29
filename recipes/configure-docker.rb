#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: configure-docker
#
# Prepares docker for running integration tests under jenkins
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
docker_image "ubuntu"
