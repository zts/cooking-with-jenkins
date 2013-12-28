#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: configure-jenkins
#
# Adds plugins and common configuration we'll rely on in our Jenkins
# job definitions.
#
# Copyright (C) 2013 Zachary Stevens
# 
# All rights reserved - Do Not Redistribute
#

# These plugins allow us to pull code (for jobs) from git
jenkins_plugin "scm-api"
jenkins_plugin "git-client"
jenkins_plugin "git"

# This colourises console output, instead of displaying literal ansi
# escape sequences in the browser.
jenkins_plugin "ansicolor"

# This plugin lets us define static files which can (optionally) be
# installed into a job's workspace before running any commands.  We
# use it to override the test-kitchen configuration to use docker
# instead of vagrant.
cookbook_file "#{node[:jenkins][:server][:home]}/custom-config-files.xml" do
  owner "jenkins"
  group "jenkins"
  mode "0644"
  notifies :restart, "service[jenkins]"
end
jenkins_plugin "token-macro"
jenkins_plugin "config-file-provider" do
  version "2.7"
  action :install
end

# This plugin lets us parse console output to report on warnings.
# We'll use this to extract foodcritic's complaints, per the
# instructions on http://acrmp.github.io/foodcritic/#ci
jenkins_plugin "analysis-core"
jenkins_plugin "warnings"
