module using_flatten4;
import std.algorithm;
import std.range;
import std.string;
import rank2;
import flatten4;

void main()
{
    auto rank3 = [[[0,1,2],[3,4,5],[6] ]
                 ,[[7],[],[8,9],[10,11]]
                 ,[[],[12]             ]
                 ,[[13]                ]];

    auto rank1 = flatten(rank3);
    assert(rank!(typeof(rank1)) == 1); // Yup, it's a linear range
    assert(equal( rank1, [0,1,2,3,4,5,6,7,8,9,10,11,12,13] ));

    auto stillRank1 = flatten(rank1);
    assert(equal( stillRank1, rank1 )); // No need to insist

    auto text =
   "Sing, O goddess, the anger of Achilles son of Peleus,
    that brought countless ills upon the Achaeans.
    Many a brave soul did it send hurrying down to Hades,
    and many a hero did it yield a prey to dogs and vultures,
    for so were the counsels of Jove fulfilled
    from the day on which the son of Atreus, king of men,
    and great Achilles, first fell out with one another.";

    auto lines = text.splitLines;   // array of strings
    string[][] words;
    foreach(line; lines) words ~= array(splitter(line, ' '));
    assert( rank!(typeof(words)) == 3); // range of range of strings
                                        // range of range of array of chars
    auto flat = flatten(words);

    assert(equal(take(flat, 50),
             "Sing,Ogoddess,theangerofAchillessonofPeleus,thatbr"));
}
