# App
strapi-scaffold

# Purpose
This app's purpose is to provide a template for a Strapi 4

# Standing up an instance of Strapi?
1. Choose a name for the app
   ```bash
   app=<app-name>
   ```
1. Clone this repo, rename it,  and remove the `.git` folder
   ```bash
   git clone git@github.com:lankeami/strapi-scaffold.git
   cp -rf strapi-scaffold $app
   cd $app
   rm -rf .git
   ```
1. Rename as necessary
   ```bash
   for i in $(find . -type f -print | grep -v node_modules | grep -v .git); do echo $i; LANG=C sed -i '' s/strapi-scaffold/$app/g $i; done
   ```
1. Rename the Jenkinsfile to kick off CICD (skip if we're not ready yet)
   ```bash
   mv Jenkinsfile.bk Jenkinsfile
   ```
1. Initialize the git repository
   ```bash
   git init .
   git add .
   git commit -m "initial commit"
   ```

# Running the app locally
This repository comes with a [Makefile](Makefile) to simplify a lot of the commands you would typically use to build and start a container

### First time running the app? Or maybe you're adding node modules?
In order to run the app, we'll need to build it, run it, and tail the logs. Fortunately, there's a single command to do just that:
   ```bash
   make local
   ```

### Running the app again?
If you've already built and run the app, you'll notice that build time is a little long. Fortunately going forward, you can skip the build:
   ```bash
   make restart
   ```

### Need to stop the container?
Once you're done with development, you can simply stop the container:
   ```bash
   make stop
   ```
