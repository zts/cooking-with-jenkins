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

end
