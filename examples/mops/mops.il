
//  Microsoft (R) .NET Framework IL Disassembler.  Version 1.0.3705.0
//  Copyright (C) Microsoft Corporation 1998-2001. All rights reserved.

.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 1:0:3300:0
}
.assembly hello
{
  // --- The following custom attribute is added automatically, do not uncomment -------
  //  .custom instance void [mscorlib]System.Diagnostics.DebuggableAttribute::.ctor(bool,
  //                                                                                bool) = ( 01 00 01 00 00 00 ) 
  .hash algorithm 0x00008004
  .ver 0:0:0:0
}
.module hello.exe
// MVID: {B0E5F267-024F-4374-8B69-829095D88C15}
.imagebase 0x00400000
.subsystem 0x00000003
.file alignment 512
.corflags 0x00000001
// Image base: 0x03010000
//
// ============== CLASS STRUCTURE DECLARATION ==================
//
.class private auto ansi beforefieldinit App
       extends [mscorlib]System.Object
{
} // end of class App


// =============================================================


// =============== GLOBAL FIELDS AND METHODS ===================


// =============================================================


// =============== CLASS MEMBERS DECLARATION ===================
//   note that class flags, 'extends' and 'implements' clauses
//          are provided here for information only

.class private auto ansi beforefieldinit App
       extends [mscorlib]System.Object
{
  .method public hidebysig static int32  Main(string[] args) cil managed
  {
    .entrypoint
    // Code size       171 (0xab)
    .maxstack  2
    .locals init ([0] int64 i1,
             [1] int64 i5,
             [2] int64 i3,
             [3] int64 i4,
             [4] valuetype [mscorlib]System.DateTime start,
             [5] valuetype [mscorlib]System.DateTime end,
             [6] float64 n1,
             [7] float64 n2,
             [8] valuetype [mscorlib]System.TimeSpan CS$00000000$00000000)
    .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'c:\test\hello.cs' 
//000009: 		long i4 = 100000000;
    IL_0000:  ldc.i4.1
    IL_0001:  conv.i8
    IL_0002:  stloc.2
//000010: 		DateTime start, end;
    IL_0003:  ldc.i4     0x5f5e100
    IL_0008:  conv.i8
    IL_0009:  stloc.3
//000011: 		double n1, n2;
//000012: 		Console.WriteLine("Iterations:    {0}", i4);
//000013: 
    IL_000a:  ldstr      "Iterations:    {0}"
    IL_000f:  ldloc.3
    IL_0010:  box        [mscorlib]System.Int64
    IL_0015:  call       void [mscorlib]System.Console::WriteLine(string,
                                                                  object)

//000024: 		i1 = 8;
//000025: 		i5 = i4 * i1;
    IL_001a:  ldc.i4.8
    IL_001b:  conv.i8
    IL_001c:  stloc.0
//000026: 		Console.WriteLine("Estimated ops: {0}", i5);
    IL_001d:  ldloc.3
    IL_001e:  ldloc.0
    IL_001f:  mul
    IL_0020:  stloc.1
//000027: 		start = DateTime.Now;
    IL_0021:  ldstr      "Estimated ops: {0}"
    IL_0026:  ldloc.1
    IL_0027:  box        [mscorlib]System.Int64
    IL_002c:  call       void [mscorlib]System.Console::WriteLine(string,
                                                                  object)
//000028: 		REDO:
    IL_0031:  call       valuetype [mscorlib]System.DateTime [mscorlib]System.DateTime::get_Now()
    IL_0036:  stloc.s    start
//000029: 			i4 = i4 - i3;
//000030: 		if (i4 > 0)
    IL_0038:  ldloc.3
    IL_0039:  ldloc.2
    IL_003a:  sub
    IL_003b:  stloc.3
//000031: 			goto REDO;
    IL_003c:  ldloc.3
    IL_003d:  ldc.i4.0
    IL_003e:  conv.i8
    IL_003f:  bgt.s      IL_0038

//000032: 		end = DateTime.Now;
//000033: 		n2 = (end-start).TotalMilliseconds;
    IL_0041:  call       valuetype [mscorlib]System.DateTime [mscorlib]System.DateTime::get_Now()
    IL_0046:  stloc.s    end
//000034: 		n2 /= 1000; // Milliseconds to seconds
    IL_0048:  ldloc.s    end
    IL_004a:  ldloc.s    start
    IL_004c:  call       valuetype [mscorlib]System.TimeSpan [mscorlib]System.DateTime::op_Subtraction(valuetype [mscorlib]System.DateTime,
                                                                                                       valuetype [mscorlib]System.DateTime)
    IL_0051:  stloc.s    CS$00000000$00000000
    IL_0053:  ldloca.s   CS$00000000$00000000
    IL_0055:  call       instance float64 [mscorlib]System.TimeSpan::get_TotalMilliseconds()
    IL_005a:  stloc.s    n2
//000035: 		Console.WriteLine("Elapsed Time:  {0}", n2);
    IL_005c:  ldloc.s    n2
    IL_005e:  ldc.r8     1000.
    IL_0067:  div
    IL_0068:  stloc.s    n2
//000036: 		n1 = i5;
    IL_006a:  ldstr      "Elapsed Time:  {0}"
    IL_006f:  ldloc.s    n2
    IL_0071:  box        [mscorlib]System.Double
    IL_0076:  call       void [mscorlib]System.Console::WriteLine(string,
                                                                  object)
//000037: 		n1 /= n2;
    IL_007b:  ldloc.1
    IL_007c:  conv.r8
    IL_007d:  stloc.s    n1
//000038: 		n2 = 100000.0;
    IL_007f:  ldloc.s    n1
    IL_0081:  ldloc.s    n2
    IL_0083:  div
    IL_0084:  stloc.s    n1
//000039: 		n1 /= n2;
    IL_0086:  ldc.r8     100000.
    IL_008f:  stloc.s    n2
//000040: 		Console.WriteLine("M op/s:        {0}", n1);
    IL_0091:  ldloc.s    n1
    IL_0093:  ldloc.s    n2
    IL_0095:  div
    IL_0096:  stloc.s    n1
//000041: 		return 0;
    IL_0098:  ldstr      "M op/s:        {0}"
    IL_009d:  ldloc.s    n1
    IL_009f:  box        [mscorlib]System.Double
    IL_00a4:  call       void [mscorlib]System.Console::WriteLine(string,
                                                                  object)
//000042: 	}
    IL_00a9:  ldc.i4.0
    IL_00aa:  ret
  } // end of method App::Main

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // Code size       7 (0x7)
    .maxstack  1
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  ret
  } // end of method App::.ctor

} // end of class App


// =============================================================

//*********** DISASSEMBLY COMPLETE ***********************
// WARNING: Created Win32 resource file hello.res
