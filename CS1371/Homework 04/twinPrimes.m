
function [logical] = twinPrimes (in)

    % This function checks whether a bunch of numbers are twin primes or not.

    % First decide whether the number itself is prime or not.
    logical0 = isprime(in);
    
    % Decide whether the number plus or minus two is prime or not.
    logical1 = isprime(in-2);
    logical2 = isprime(in+2);
    
    % If the number plus or minus two is prime, then the number is a
    % potential candidate.
    logical = logical1 | logical2;
    
    % In addition to that, the number also has to be a prime itself.
    logical = logical0 & logical;

end

%{

Function Name: twinPrimes

Inputs: 1. (double) A vector of random integers

Outputs: 1. (logical) A vector describing whether each number of the
original input vector is a member of a pair of twin primes

Function Description: Twin primes are a phenomenon in mathematics where a
pair of prime numbers exist and differ by only two. For example, 17 and 19
are both twin primes because they are prime numbers and the difference
between them is 2. Another example of twin primes are the numbers 41 and
43. It is conjectured that an infinite number of twin primes exist, and
proving this remains one of the most elusive problems in number theory to
this day (Wolfram MathWorld). For more information on twin primes, you may
visit: http://mathworld.wolfram.com/TwinPrimes.html

For example, if an input vector contained the following numbers:

vec = [41 23 13 4 11 43 13 8]

Then your vector plus or minus two will be the following:

vecPlus2 = [43 25 15 6 13 45 15 10] vecMinus2 = [39 21 11 2 9 41 11 6]

The values in the first index of both vec and vecPlus2 are prime numbers,
so the first number in vec is a member of a twin prime pair. The values in
the third index of vec and vecMinus2 are also both prime, so the third
number in vec is a member of a twin prime pair. The output of this function
with vec as the input will be the following:

out => [true false true false true true true false]

Given an input vector of random integers, write a function in MATLAB that
will determine which of the numbers in the input vector are members of a
pair of twin primes.

Notes: ? You must determine if the numbers in the vector are members of a
pair of twin primes, but each one could be the first in the pair or the
second in the pair. ? Each number in the vector will be of the value three
or greater. This should not affect your code: it is to account for any
corner cases (that could have potentially messed you up) involving negative
numbers and the isprime() function.

Hints: ? The isprime() function may come in very handy for this function.

%}

% Thank you Sean and Rachael for grading our work!!

%-- 9/8/2015 11:50 AM --%