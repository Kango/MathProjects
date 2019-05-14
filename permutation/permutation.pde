

// by  clankill3r

import java.math.BigInteger;

int[] elements = {
  0, 1, 2, 3, 4, 5
};
IntList[] permutation;

void setup() {
  size(1220, 600);
  funcForPermutation();
  fill(0); 
  println ("End of setup.");
} //

void draw() {
  // println (permutation.toString ());
  text("Permutation\n"
    +permutation[0]
    +"\n"
    +permutation[120]
    +"\n\n"
    , 20, 30);// +permutation.size() 
  println (permutation[0]);
  println (permutation[120]);
  noLoop();
}

// ------------------------------------------------------------------

void funcForPermutation() {
  PermutationGenerator x = new PermutationGenerator (elements.length);

  int[] indices;

  int i2 = 0; 

  permutation=  new IntList [ 720 ]; //  PermutationGenerator.getTotal ()  ];
  while (x.hasMore ()) {
    permutation[i2] = new IntList ();
    indices = x.getNext ();
    for (int i = 0; i < indices.length; i++) {
      permutation[ i2 ].append (elements[indices[i]]);
    }
    // println (permutation[i2].toString ());
    i2++;
  }
  println(i2);
}

// ==========================================================================

class PermutationGenerator {

  int[] a;
  BigInteger numLeft;
  BigInteger total;

  //-----------------------------------------------------------
  // Constructor. WARNING: Don't make n too large.
  // Recall that the number of permutations is n!
  // which can be very large, even when n is as small as 20 --
  // 20! = 2,432,902,008,176,640,000 and
  // 21! is too big to fit into a Java long, which is
  // why we use BigInteger instead.
  //----------------------------------------------------------

  PermutationGenerator (int n) {
    if (n < 1) {
      throw new IllegalArgumentException ("Min 1");
    }
    a = new int[n];
    total = getFactorial (n);
    reset ();
  }

  //------
  // Reset
  //------

  void reset () {
    for (int i = 0; i < a.length; i++) {
      a[i] = i;
    }
    numLeft = new BigInteger (total.toString ());
  }

  //------------------------------------------------
  // Return number of permutations not yet generated
  //------------------------------------------------

  BigInteger getNumLeft () {
    return numLeft;
  }

  //------------------------------------
  // Return total number of permutations
  //------------------------------------

  BigInteger getTotal () {
    return total;
  }

  //-----------------------------
  // Are there more permutations?
  //-----------------------------

  boolean hasMore () {
    return numLeft.compareTo (BigInteger.ZERO) == 1;
  }

  //------------------
  // Compute factorial
  //------------------

  BigInteger getFactorial (int n) {
    BigInteger fact = BigInteger.ONE;
    for (int i = n; i > 1; i--) {
      fact = fact.multiply (new BigInteger (Integer.toString (i)));
    }
    return fact;
  }

  //--------------------------------------------------------
  // Generate next permutation (algorithm from Rosen p. 284)
  //--------------------------------------------------------

  int[] getNext () {

    if (numLeft.equals (total)) {
      numLeft = numLeft.subtract (BigInteger.ONE);
      return a;
    }

    int temp;

    // Find largest index j with a[j] < a[j+1]

    int j = a.length - 2;
    while (a[j] > a[j+1]) {
      j--;
    }

    // Find index k such that a[k] is smallest integer
    // greater than a[j] to the right of a[j]

    int k = a.length - 1;
    while (a[j] > a[k]) {
      k--;
    }

    // Interchange a[j] and a[k]

    temp = a[k];
    a[k] = a[j];
    a[j] = temp;

    // Put tail end of permutation after jth position in increasing order

    int r = a.length - 1;
    int s = j + 1;

    while (r > s) {
      temp = a[s];
      a[s] = a[r];
      a[r] = temp;
      r--;
      s++;
    }

    numLeft = numLeft.subtract (BigInteger.ONE);
    return a;
  }
} //class
//
