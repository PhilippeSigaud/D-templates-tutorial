module usingrelational;
import std.stdio;
import relational;

alias Entry!("Name",     string
            ,"EmployId", int
            ,"Dept", string) Employee;

alias Entry!("DeptName", string
            ,"Manager",  string) Dept;

void main()
{
    auto e = entry!("Name", "EmployId", "DeptName")("John", 1, "Tech");
    auto e2 = Employee("Susan", 2, "Financial");
    auto e3 = Employee("Bob", 3, "Financial");
    auto e4 = Employee("Sri", 4, "Tech");

    auto d1 = Dept("Tech", "Sri");
    auto d2 = Dept("Financial", "Bob");

    auto employees = [e2,e3,e4];
    auto depts = [d1, d2];

    writeln(employees);

    writeln(rename!("Dept", "DN")(employees));
}
