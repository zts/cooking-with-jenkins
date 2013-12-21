require "spec_helper"

describe "cooking-with-jenkins::default" do

  it "listens on port 8080" do
    expect(port(8080)).to be_listening
  end

  it "displays the Jenkins home page on port 8080" do
    expect(command 'wget -q -O - http://localhost:8080/').to return_stdout /.*Jenkins.*/
  end

  it "installs git" do
    expect(command 'which git').to return_stdout /.*\/bin\/git.*/
  end

  it "installs the Jenkins git plugins" do
    %w{ scm-api git git-client }.each do |p|
      search = "plugin/#{p}/uninstall"
      list_installed_plugins = "wget -q -O - http://localhost:8080/pluginManager/installed"
      expect(command list_installed_plugins).to return_stdout /.*#{Regexp.quote(search)}.*/
    end
  end

  it "creates a job for the memcached cookbook" do
    list_jobs = "wget -q -O - http://localhost:8080/rssAll"
    job_name = "memcached-cookbook"
    expect(command list_jobs).to return_stdout /.*#{Regexp.quote(job_name)}.*/
  end
end
