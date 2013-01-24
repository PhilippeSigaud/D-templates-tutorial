module using_flatten1;
import flatten1;

void main()
{
    assert( flatten([[0,1],[2,3],[4]]) == [0,1,2,3,4] );
    assert( flatten([[0,1]]) == [0,1] );
    assert( flatten([0,1]) == [0,1] );
    assert( flatten(0) == 0 );

    assert( flatten([[[0,1],[]], [[2]], [[3], [4,5]], [[]], [[6,7,8]]])
            == [0,1,2,3,4,5,6,7,8] );
}
