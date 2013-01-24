module parametrizedbaseclass;

interface ISerializable
{
    size_t serialize() @property;
}

class Serializable(T) : T, ISerializable
{
    size_t serialize() @property
    {
        return this.tohash;
    }
}
