# Vagrant Box for WordPress

@todo: need to keep wp-config.php outside of wordpress install...
@todo: Add config folder to server on startup (e.g. to load custom php.ini)

### Requirements
1. Git (http://git-scm.com/)
2. Vagrant (https://www.vagrantup.com/)
3. (database gui optional)

### Installation
1. Designate an IP address in the `Vagrantfile`.
2. Designate a name for your local database in `www/local-config.php`.
3. Install WordPress via Git submodules:
        $ git submodule init
        $ git submodule update
4. Create your environment in a directory called 'www'
5. Start the virtual machine:
        $ vagrant up

### Theme Configuration
i. Do we need a theme bootstrap?
ii. Git submodules
1. npm
2. grunt (compiling)
3. composer?
4. bower?

### Prepare Database for Import (WP-CLI)
@note: We probably shouldn't enable an easy way to send local data up
1. (in progress)

### Updating Content
1. Configure retrieve_latest_content script
2. Run script

### Deployment
1. SSH Keys (Local <--> Remote Repo <--> Remote Server)
2. Configure deploy.rb (www/config)
