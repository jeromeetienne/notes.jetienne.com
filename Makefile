#!/usr/bin/make
# makefile to automate stuff

PROJECT_NAME=notes.jetienne.com

all:

server:
	jekyll --server 8080 --auto

build:
	jekyll
	cp CNAME jekyll
	
clean:
	rm -rf _site/

#################################################################################
#		deploy								#
#################################################################################

deploy:	build deployGhPage

deployGhPage:
	(cd ../notes.jetienne.com.gh-pages && git pull origin gh-pages)
	(cd ../notes.jetienne.com.gh-pages && cp -a ../notes.jetienne.com/_site/* .)
	(cd ../notes.jetienne.com.gh-pages && git add .)
	(cd ../notes.jetienne.com.gh-pages && git commit -a -m 'new deployment')
	(cd ../notes.jetienne.com.gh-pages && git push origin gh-pages)
