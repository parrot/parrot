// created on 03/03/2002 at 15:12
using System;

class App {
	public static int Main(String[] args) {
		int i1, i5;
		// int i2 = 0;
		int i3 = 1;
		int i4 = 100000000;
		DateTime start, end;
		double n1, n2;
		Console.WriteLine("Iterations:    {0}", i4);

//  IL_0038:  ldloc.3
//  IL_0039:  ldloc.2
//  IL_003a:  sub
//  IL_003b:  stloc.3
//  IL_003c:  ldloc.3
//  IL_003d:  ldc.i4.0
//  IL_003e:  conv.i8
//  IL_003f:  bgt.s      IL_0038
//
// Insane, isn't it?
		i1 = 8;
		i5 = i4 * i1;
		Console.WriteLine("Estimated ops: {0}", i5);
		start = DateTime.Now;
		REDO:
			i4 = i4 - i3;
		if (i4 > 0)
			goto REDO;
		end = DateTime.Now;
		n2 = (end-start).TotalMilliseconds;
		n2 /= 1000; // Milliseconds to seconds
		Console.WriteLine("Elapsed Time:  {0}", n2);
		n1 = i5;
		n1 /= n2;
		n2 = 1000000.0;
		n1 /= n2;
		Console.WriteLine("M op/s:        {0}", n1);
		return 0;
	}
}
