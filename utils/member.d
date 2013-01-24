module member;

struct Member(string n, T)
{
    enum name = n; // for external access
    alias T Type;
}
