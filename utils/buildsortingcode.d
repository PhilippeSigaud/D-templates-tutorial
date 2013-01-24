module buildsortingcode;
import stringinterpolation;
import sortingnetwork;

string buildSortingCode(size_t l)()
{
    enum network = sortingNetwork!(l);
    string result;
    foreach(elem; network) result ~=
        interpolate!(
        "t1 = input[#0];
         t2 = input[#1];
         if (!binaryFun!pred(t1, t2))
         {
             auto temp = t2;
             input[#1] = t1;
             input[#0] = temp;
         }\n")(elem[0], elem[1]);
    return result;
}
