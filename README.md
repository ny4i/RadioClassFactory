# RadioClassFactory
Test of a Class Factory for a TRadio object and descendants.

In supporting [TR4W](https://github.com/github/tr4w), I wanted to create a generic Radio base class and then have the different radio types be of type TRadio. But in the implementation, I just want to reference TRadio and not the specific TK4Radio or TFlexRadio.

I created the base TRadio class with virtual, abstract functions to ensure the descentant classes implemented the required classes like SetFreqency, SetMode, etc.

But I was having trouble when I referenced the object TRadio instead of the TK4Radio derived from TRadio. I was getting abstract errors. 
The secret turned out to be that I had to set override on each of the implemented functions in the descentant classes. Surprisinly, that was not very clear in any of the docuemntation I read about using virtual, abstract classes.

I also added the idea of a class function that decided based on a parameter what type of object to create.

This now lets me create a base class TRadio with some common code such as socket communication with TCP/IP radios but implement the specific functions in the descentant classed. So in TK4Radio (of type TRadio), when I call SendCW, it calls SendToRadio to send KY NY4I (for example).
But when I call SendCW in TFlexRadio, it can implement a different command.

This makes adding new radios easier.


