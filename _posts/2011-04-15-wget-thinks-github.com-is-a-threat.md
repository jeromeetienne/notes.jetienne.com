---
layout: post
published: true
title: wget thinks github.com is a threat
---

This is just a little post on a oddity. As a coder, i use [github](http://github.com)
and [wget](http://www.gnu.org/software/wget/) everyday or close. When i do, i
see this message.

    $ wget https://github.com/jeromeetienne/nmod/raw/master/nmod
    ...
    ERROR: certificate common name `*.github.com' doesn't match requested
    host name `github.com'.
    To connect to github.com insecurely, use `--no-check-certificate'.

This message puzzles me quite a bit...
[wget](http://www.gnu.org/software/wget/)
thinks 
***[github](http://github.com)
is a threat*** ... and requires an explicit action
from you (adding `--no-check-certificate`) to be sure you are willing to take this ***risk*** .
The risk of downloading files from github... ok lets admit it, ***this is ridiculous***.
[wget](http://www.gnu.org/software/wget/) distrusting [github](http://github.com) is
like ... [ls](http://en.wikipedia.org/wiki/Ls) distrusting [cd](http://en.wikipedia.org/wiki/Cd_(command\)) :)

According to github, [this is actually a wget bug which has been reported and fixed but not release](http://support.github.com/discussions/site/2507-error-certificate-common-name-githubcom-doesnt-match-requested-host-name-githubcom)
, and point to a [bug from 2007](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=409938)!!!!
Dunno if this is true, or who is at the best place to fix the issue... and the purpose of this post
is not to do finger pointing.

Lets note that everybody is from open source world here.
wget is from gnu, not only under gpl, but
[even got his copyright assigned to fsf](http://en.wikipedia.org/wiki/Wget#Authors_and_copyright).
What to say about github and opensource ? well they got [millions of
repositories](https://github.com/blog/685-one-million-repositories)
and most of them are open source software.

This post is not meant to be a rant. More to put the light on an oddity. something that i see
as a `symptom of communication issue` in the opensource community.

Let do better! :)