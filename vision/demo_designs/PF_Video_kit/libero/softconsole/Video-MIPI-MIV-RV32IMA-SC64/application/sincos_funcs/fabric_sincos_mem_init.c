#include <unistd.h>



extern uint32_t *sin_mem_base_addr;
extern uint32_t *cos_mem_base_addr;


 uint32_t sin_mem[181] = { 0x00000000,
                               0x00000009,
                               0x00000012,
                               0x0000001b,
                               0x00000024,
                               0x0000002d,
                               0x00000036,
                               0x0000003e,
                               0x00000047,
                               0x00000050,
                               0x00000059,
                               0x00000062,
                               0x0000006a,
                               0x00000073,
                               0x0000007c,
                               0x00000085,
                               0x0000008d,
                               0x00000096,
                               0x0000009e,
                               0x000000a7,
                               0x000000af,
                               0x000000b7,
                               0x000000c0,
                               0x000000c8,
                               0x000000d0,
                               0x000000d8,
                               0x000000e0,
                               0x000000e8,
                               0x000000f0,
                               0x000000f8,
                               0x00000100,
                               0x00000108,
                               0x0000010f,
                               0x00000117,
                               0x0000011e,
                               0x00000126,
                               0x0000012d,
                               0x00000134,
                               0x0000013b,
                               0x00000142,
                               0x00000149,
                               0x00000150,
                               0x00000157,
                               0x0000015d,
                               0x00000164,
                               0x0000016a,
                               0x00000170,
                               0x00000176,
                               0x0000017c,
                               0x00000182,
                               0x00000188,
                               0x0000018e,
                               0x00000193,
                               0x00000199,
                               0x0000019e,
                               0x000001a3,
                               0x000001a8,
                               0x000001ad,
                               0x000001b2,
                               0x000001b7,
                               0x000001bb,
                               0x000001c0,
                               0x000001c4,
                               0x000001c8,
                               0x000001cc,
                               0x000001d0,
                               0x000001d4,
                               0x000001d7,
                               0x000001db,
                               0x000001de,
                               0x000001e1,
                               0x000001e4,
                               0x000001e7,
                               0x000001ea,
                               0x000001ec,
                               0x000001ef,
                               0x000001f1,
                               0x000001f3,
                               0x000001f5,
                               0x000001f7,
                               0x000001f8,
                               0x000001fa,
                               0x000001fb,
                               0x000001fc,
                               0x000001fd,
                               0x000001fe,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001fe,
                               0x000001fd,
                               0x000001fc,
                               0x000001fb,
                               0x000001fa,
                               0x000001f8,
                               0x000001f7,
                               0x000001f5,
                               0x000001f3,
                               0x000001f1,
                               0x000001ef,
                               0x000001ec,
                               0x000001ea,
                               0x000001e7,
                               0x000001e4,
                               0x000001e1,
                               0x000001de,
                               0x000001db,
                               0x000001d7,
                               0x000001d4,
                               0x000001d0,
                               0x000001cc,
                               0x000001c8,
                               0x000001c4,
                               0x000001c0,
                               0x000001bb,
                               0x000001b7,
                               0x000001b2,
                               0x000001ad,
                               0x000001a8,
                               0x000001a3,
                               0x0000019e,
                               0x00000199,
                               0x00000193,
                               0x0000018e,
                               0x00000188,
                               0x00000182,
                               0x0000017c,
                               0x00000176,
                               0x00000170,
                               0x0000016a,
                               0x00000164,
                               0x0000015d,
                               0x00000157,
                               0x00000150,
                               0x00000149,
                               0x00000142,
                               0x0000013b,
                               0x00000134,
                               0x0000012d,
                               0x00000126,
                               0x0000011e,
                               0x00000117,
                               0x0000010f,
                               0x00000108,
                               0x00000100,
                               0x000000f8,
                               0x000000f0,
                               0x000000e8,
                               0x000000e0,
                               0x000000d8,
                               0x000000d0,
                               0x000000c8,
                               0x000000c0,
                               0x000000b7,
                               0x000000af,
                               0x000000a7,
                               0x0000009e,
                               0x00000096,
                               0x0000008d,
                               0x00000085,
                               0x0000007c,
                               0x00000073,
                               0x0000006a,
                               0x00000062,
                               0x00000059,
                               0x00000050,
                               0x00000047,
                               0x0000003e,
                               0x00000036,
                               0x0000002d,
                               0x00000024,
                               0x0000001b,
                               0x00000012,
                               0x00000009,
                               0x00000000
	                         };
	 uint32_t cos_mem[181] = { 0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001ff,
                               0x000001fe,
                               0x000001fd,
                               0x000001fc,
                               0x000001fb,
                               0x000001fa,
                               0x000001f8,
                               0x000001f7,
                               0x000001f5,
                               0x000001f3,
                               0x000001f1,
                               0x000001ef,
                               0x000001ec,
                               0x000001ea,
                               0x000001e7,
                               0x000001e4,
                               0x000001e1,
                               0x000001de,
                               0x000001db,
                               0x000001d7,
                               0x000001d4,
                               0x000001d0,
                               0x000001cc,
                               0x000001c8,
                               0x000001c4,
                               0x000001c0,
                               0x000001bb,
                               0x000001b7,
                               0x000001b2,
                               0x000001ad,
                               0x000001a8,
                               0x000001a3,
                               0x0000019e,
                               0x00000199,
                               0x00000193,
                               0x0000018e,
                               0x00000188,
                               0x00000182,
                               0x0000017c,
                               0x00000176,
                               0x00000170,
                               0x0000016a,
                               0x00000164,
                               0x0000015d,
                               0x00000157,
                               0x00000150,
                               0x00000149,
                               0x00000142,
                               0x0000013b,
                               0x00000134,
                               0x0000012d,
                               0x00000126,
                               0x0000011e,
                               0x00000117,
                               0x0000010f,
                               0x00000108,
                               0x00000100,
                               0x000000f8,
                               0x000000f0,
                               0x000000e8,
                               0x000000e0,
                               0x000000d8,
                               0x000000d0,
                               0x000000c8,
                               0x000000c0,
                               0x000000b7,
                               0x000000af,
                               0x000000a7,
                               0x0000009e,
                               0x00000096,
                               0x0000008d,
                               0x00000085,
                               0x0000007c,
                               0x00000073,
                               0x0000006a,
                               0x00000062,
                               0x00000059,
                               0x00000050,
                               0x00000047,
                               0x0000003e,
                               0x00000036,
                               0x0000002d,
                               0x00000024,
                               0x0000001b,
                               0x00000012,
                               0x00000009,
                               0x00000000,
                               0x000003f7,
                               0x000003ee,
                               0x000003e5,
                               0x000003dc,
                               0x000003d3,
                               0x000003ca,
                               0x000003c2,
                               0x000003b9,
                               0x000003b0,
                               0x000003a7,
                               0x0000039e,
                               0x00000396,
                               0x0000038d,
                               0x00000384,
                               0x0000037b,
                               0x00000373,
                               0x0000036a,
                               0x00000362,
                               0x00000359,
                               0x00000351,
                               0x00000349,
                               0x00000340,
                               0x00000338,
                               0x00000330,
                               0x00000328,
                               0x00000320,
                               0x00000318,
                               0x00000310,
                               0x00000308,
                               0x00000300,
                               0x000002f8,
                               0x000002f1,
                               0x000002e9,
                               0x000002e2,
                               0x000002da,
                               0x000002d3,
                               0x000002cc,
                               0x000002c5,
                               0x000002be,
                               0x000002b7,
                               0x000002b0,
                               0x000002a9,
                               0x000002a3,
                               0x0000029c,
                               0x00000296,
                               0x00000290,
                               0x0000028a,
                               0x00000284,
                               0x0000027e,
                               0x00000278,
                               0x00000272,
                               0x0000026d,
                               0x00000267,
                               0x00000262,
                               0x0000025d,
                               0x00000258,
                               0x00000253,
                               0x0000024e,
                               0x00000249,
                               0x00000245,
                               0x00000240,
                               0x0000023c,
                               0x00000238,
                               0x00000234,
                               0x00000230,
                               0x0000022c,
                               0x00000229,
                               0x00000225,
                               0x00000222,
                               0x0000021f,
                               0x0000021c,
                               0x00000219,
                               0x00000216,
                               0x00000214,
                               0x00000211,
                               0x0000020f,
                               0x0000020d,
                               0x0000020b,
                               0x00000209,
                               0x00000208,
                               0x00000206,
                               0x00000205,
                               0x00000204,
                               0x00000203,
                               0x00000202,
                               0x00000201,
                               0x00000201,
                               0x00000200,
                               0x00000200,
                               0x00000200
	                         };

 void sincos_mem_init () {

	 uint16_t count;


	 for (count = 0;count <= 180 ; count++)
	 {
		 *(sin_mem_base_addr + count*4) = sin_mem[count];
         *(cos_mem_base_addr + count*4) = cos_mem[count];
	 }
 }
