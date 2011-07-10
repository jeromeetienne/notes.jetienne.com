---
layout: post
published: true
title: Javascript Class Inheritance ala vapor.js in 3 lines
---
This post describes a standalone way to add class inheritance in your javascript code.
We will do that ala [vapor.js](https://github.com/madrobby/vapor.js), so no
dependancy or external framework. A vaporjs inheritance is only 3 lines!

Lets get started, say you got a class *animal*. It gonna have a constructor and a
method *talk*.

    var Animal = function(opts){}
    Animal.prototype.talk	= function(){ return 'mumble';  }
    Animal.prototype.sleep	= function(){ return 'zzzzz';   }

# How to write the inheritance

Now let write a *Cat* class which inherits from *Animal*. It will override the animal
method *talk*.

    var Cat = function(opts){
        // call the parent class constructor (one line)
        Animal.call(this, opts)
    }

    // inherit from Animal methods (two lines)
    Cat.prototype = new Animal();
    Cat.prototype.constructor = Animal;

    // override talk method
    Cat.prototype.talk = function(){
        return "maow"
    }

So a vaporjs inheritance is only 3 lines!

# Lets test methods override

Now lets test the result of all this

    var cat = new Cat()
    console.log("cat sleep as ", cat.sleep());
    console.log("cat talk as ", cat.talk());
    
This will display

    cat sleep as zzzzz
    cat talk as maow

So `.talk()` is actually overridden, and .sleep() is properly passed to the parent class *Animal*.

# Lets test instanceOf semantic

Last but not least, the [instanceOf](https://developer.mozilla.org/en/JavaScript/Reference/Operators/Special/instanceof)
operator which is so important for javascript 

    console.log("Cat instanceof Cat", cat instanceof Cat);
    console.log("Cat instanceof Animal", cat instanceof Animal);

will display

    Cat instanceof Cat true
    Cat instanceof Animal true

So `cat` object is an instance of the class *Cat* and of the class *Animal* which is the good
semantic for *instanceOf*.

That's all folks. have fun.