module publisher;

public mixin template PublisherMixin()
{
    import std.functional : toDelegate;
    import std.stdio;

    alias void delegate(Object sender, string event) CallBack;
    alias void function(Object sender, string event) CallBackFun;


    bool[CallBack] callBacks;  // int[0][CallBack] may be even smaller

    //Register subscriber
    void register(CallBack callBack)
    {
    // Ensure subscriber is not yet registered.
        if (callBack in callBacks)
            writeln("Subscriber is already registered.");
        else
            callBacks[callBack] = true; //from;
    }

// Register Subscriber via function ptr.
    void register(CallBackFun callBackFun)
    {
        register( toDelegate(callBackFun) );
    }

    // Remove Subscriber
    void unRegister(CallBack callBack)
    {
        if (callBack in callBacks)
            callBacks.remove(callBack);
        else
            writeln("Trying to remove an unknown callback.");
    }

    // Remove Subscriber via function ptr.
    void unRegister(CallBackFun callBackFun)
    {
        unRegister(toDelegate(callBackFun));
    }

    // Notify ALL Subscribers
    void notify(Object from, string evt)
    {
        foreach ( CallBack cb, bool origin ; callBacks )
        {
            cb( from, evt );
        }
    }
}

mixin template StackMixin()
{
    // get parent type
    alias typeof(this) Me;
    static Me[] stack;

protected:

    @property bool empty()  { return stack.length == 0;  }
    @property size_t count()   { return stack.length; }

    void push(Me element)
    {
        stack ~= element;
    }

    Me pop()
    {
        Me el = peek();
        stack.length -= 1;
        return el;
    }

    Me peek()
    {
        if ( stack.length == 0 )
            throw new Exception("peek on an empty statck.");

        Me el = stack[stack.length-1];
        return el;
    }
}
