# cooking-with-jenkins cookbook

This cookbook exists to show how Jenkins can be configured to build a
CI pipeline for Chef cookbook development.  See
[the accompanying blog post](http://www.cryptocracy.com/blog/2014/01/03/cooking-with-jenkins-test-kitchen-and-docker/)
for details and commentary.

# Requirements

Ubuntu 13.04 is the only supported system.

To use the included Vagrantfile, you'll need Vagrant with the
vagrant-berkshelf and vagrant-omnibus plugins installed. It should
work fine under Virtualbox, but I've been using VMware as it seems to
cope better under load.

# Usage

Checkout this repository and run `vagrant up`.  When Vagrant finishes
provisioning the machine, Jenkins will be available on
[http://localhost:8080/](http://localhost:8080/).

_Known Issue:_ The machine creates test jobs for three cookbooks, and
the first test run for each (during provisioning) fails.  I suspect
this would be fixed by restarting Jenkins after adding plugins (the
"configure-jenkins" recipe) and before defining the jobs, but it
didn't bother me enough to add the necessary hackery.

Click "Build Now" on each job and you'll see them work correctly.

# Attributes

# Recipes

# Author

Author:: Zachary Stevens (<zts@cryptocracy.com>)
