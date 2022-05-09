pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";

template RangeProof(n) {
    assert(n <= 252);
    signal input in; // this is the number to be proved inside the range
    signal input range[2]; // the two elements should be the range, i.e. [lower bound, upper bound]
    signal inter [2];
    signal output out;

    component low = LessEqThan(n);
    component high = GreaterEqThan(n);

    // [assignment] insert your code here
    // income should be lower than upper bound
    low.in[0] <== in;
    low.in[1] <== range[1];
    inter[0] <== low.out;
    // and greater than the lower bound
    high.in[0] <== in;
    high.in[1] <== range[0];
    inter[1] <== high.out;

    // both intermidiate values should be 1
    out <== inter[0] * inter[1];
}