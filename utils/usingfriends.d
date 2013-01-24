module usingfriends;
import friends;

void main()
{
    auto p = new FriendStack();
    auto p2 = new ExtFriendStack();

    // Register  some subscribers.
    p.register(  &twitter );
    p2.register( &twitter );
    p2.register( &blog );
    p2.register( &blog );

    // Push and Pop
    p.pushFriend( "Alex", 19 );
    p.pushFriend( "Tommy", 55);
    p2.pushFriend( "Hans", 42, false);
    p2.pushFriend( "Walt", 101, true);

    p.popFriend();
    p2.popFriend();
    p2.popFriend();

    p.unRegister( &twitter );
    p2.unRegister( &twitter );
    p.register( &blog );
    p.pushFriend( "Alexej", 33 );
}
