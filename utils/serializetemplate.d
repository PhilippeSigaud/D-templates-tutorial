module serializetemplate;

enum SerializationPolicy { policy1, policy2 }

interface ISerializable
(SerializationPolicy policy = SerializationPolicy.policy1)
{
    static if (is(policy == SerializationPolicy.policy1))
        void serialize() { /*...*/ }
    else
        void serialize() { /*...*/ }
}

class Serializable(T, Policy) : T, ISerializable!Policy
{
    /*...*/
}
