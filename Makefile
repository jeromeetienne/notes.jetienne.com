#!/usr/bin/make
# makefile to automate stuff

PROJECT_NAME=notes.jetienne.com

all:

server:
	jekyll --server 8080 --auto


#################################################################################
#		deploy								#
#################################################################################

deploy:	deployGhPage

deployGhPage:
	rm -rf /tmp/$(PROJECT_NAME)GhPages
	(git clone . /tmp/$(PROJECT_NAME)GhPages)
	(cd /tmp/$(PROJECT_NAME)GhPages && git checkout gh-pages)
	(cd /tmp/$(PROJECT_NAME)GhPages && git remote rm origin)
	(cd /tmp/$(PROJECT_NAME)GhPages && git remote add origin git@github.com:jeromeetienne/$(PROJECT_NAME).git)
	mkdir -p /tmp/$(PROJECT_NAME)GhPages/_site && jekyll . /tmp/$(PROJECT_NAME)GhPages/_site
	mv /tmp/$(PROJECT_NAME)GhPages/_site/* /tmp/$(PROJECT_NAME)GhPages
	rm -rf /tmp/$(PROJECT_NAME)GhPages/_site
	(cd /tmp/$(PROJECT_NAME)GhPages && git add . && git commit -a -m "Another deployement" && git pull origin gh-pages && git push origin gh-pages)
	#rm -rf /tmp/$(PROJECT_NAME)GhPages