module friends;
import std.stdio;
import publisher;

class FriendStack
{
    private string name;
    private int age;

    // Our Mixins
    mixin StackMixin;
    mixin PublisherMixin;

    void pushFriend(string name, int age)
    {
        // Create new instance for the Stack.
        auto person = new FriendStack();
        person.name = name;
        person.age = age;

        push(person);

        // Notify all subscribers
        notify(person, "Push");
    }

    //Pop
    void popFriend()
    {
        auto person = pop();
        notify( person, "Pop");
    }

    // Subscriber method
    void inHouseInfo(Object sender, string msg)
    {
        auto p = cast(FriendStack)sender;
        writefln("Subscriber: in House , Name: %s, Age: %s, Message: %s \n",
                 p.name, p.age, msg);
    }
}

class ExtFriendStack : FriendStack // our VIPs
{
    private bool isDeveloper;

    // Push
    void pushFriend(string name, int age, bool D)
    {
        // Create new instance for the Stack.
        auto xperson = new ExtFriendStack();
        xperson.name = name;
        xperson.age = age;
        xperson.isDeveloper = D;

        push(xperson);

        // Notify all subscribers
        notify(xperson, "Push");
    }
}

/**
 *
 *  FRIENDSTACK Subscriber functions - Used by FriendStack AND ExtFriendStack.
 */
void twitter(Object sender, string msg)
{
    auto p = cast(FriendStack)sender;
    writefln("Subscriber: Twitter, Name: %s, Age: %s, Message: %s \n",
             p.name, p.age, msg);
}

void reddit(Object sender, string msg)
{
    auto p = cast(FriendStack)sender;
    writefln("Subscriber: Reddit, Name: %s, Age: %s, Message: %s \n",
             p.name, p.age, msg);
}

void mail(Object sender, string msg)
{
    auto p = cast(FriendStack)sender;
    writefln("Subscriber: eMail, Name: %s, Age: %s, Message: %s \n",
             p.name, p.age, msg);
}

/**
 *
 *  EXTENDED FRIENDSTACK Subscriber functions
 *  contains additional --isDeveloper-- information.
 */
void blog(Object sender, string msg)
{
    if ( cast(ExtFriendStack)sender )
    {
        auto p = cast(ExtFriendStack)sender;
        writefln("Subscriber: Blog, Name: %s, Age: %s, Is Developer ?: %s, Message: %s \n",
                 p.name, p.age, p.isDeveloper, msg);
    }
    else
    {
        writeln("----- Blog is for VIPs only ------ Message rooted to email");
        mail(sender, msg);

        // Downcast is also possible
        //auto p = cast(FriendStack)sender;
        //writefln("Subscriber: Blog, Name: %s, Age:  %s, Message: %s \n",
        //         p.name, p.age, msg);
    }
}
