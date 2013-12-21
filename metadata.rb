name             'cooking-with-jenkins'
maintainer       'Zachary Stevens'
maintainer_email 'zts@cryptocracy.com'
license          'All rights reserved'
description      'Cookbook to demonstrate using Jenkins for Chef Cookbook CI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# We'll be needing jenkins
depends 'apt'
depends 'jenkins', '~> 1.2.0'

# We'll be pulling cookbooks using git
depends 'git', '~> 2.5'
