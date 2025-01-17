/* GEM Resource C Source */

#include <portab.h>
#include <aes.h>
#include "WINDOWS.H"

#if !defined(WHITEBAK)
#define WHITEBAK    0x0040
#endif
#if !defined(DRAW3D)
#define DRAW3D      0x0080
#endif

#define FLAGS9  0x0200
#define FLAGS10 0x0400
#define FLAGS11 0x0800
#define FLAGS12 0x1000
#define FLAGS13 0x2000
#define FLAGS14 0x4000
#define FLAGS15 0x8000
#define STATE8  0x0100
#define STATE9  0x0200
#define STATE10 0x0400
#define STATE11 0x0800
#define STATE12 0x1000
#define STATE13 0x2000
#define STATE14 0x4000
#define STATE15 0x8000

TEDINFO rs_tedinfo[] =
{ "\0",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x11A1, 0, 1, 1, 1,
  "\0",
  "\0",
  "\0",
  IBM  , 0, TE_LEFT , 0x1180, 0, 1, 1, 1,
  "RRR MMM 99 1999",
  "\0",
  "\0",
  IBM  , 0, TE_RIGHT, 0x1100, 0, 0, 16, 1,
  "Namexxxxxxxxxxxxxxxxxxxxx",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1100, 0, 0, 26, 1,
  "Firmaxxxxxxxxxxxxxxxxxxxx",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1100, 0, 0, 26, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "x",
  "\0",
  "\0",
  IBM  , 0, TE_CNTR , 0x1180, 0, 0, 2, 1,
  "wind_update/blocked \001       dialog \001",
  "\0",
  "\0",
  SMALL, 0, TE_RIGHT, 0x1100, 0, 0, 37, 1,
  "owns mouse \001        timer \001",
  "\0",
  "\0",
  SMALL, 0, TE_RIGHT, 0x1100, 0, 0, 28, 1,
  "has/owns menu bar \001      message \001",
  "\0",
  "\0",
  SMALL, 0, TE_RIGHT, 0x1100, 0, 0, 35, 1,
  "has window/top \001      mouse 2 \001",
  "\0",
  "\0",
  SMALL, 0, TE_RIGHT, 0x1100, 0, 0, 32, 1,
  "mouse 1 \001",
  "\0",
  "\0",
  SMALL, 0, TE_RIGHT, 0x1100, 0, 0, 10, 1,
  "[RESET wind_update",
  "\0",
  "\0",
  SMALL, 0, TE_CNTR , 0x1180, 0, -1, 19, 1,
  "button \001",
  "\0",
  "\0",
  SMALL, 0, TE_RIGHT, 0x1100, 0, 0, 9, 1,
  "keyboard \001",
  "\0",
  "\0",
  SMALL, 0, TE_RIGHT, 0x1100, 0, 0, 11, 1
};

WORD RSBB0DATA[] =
{ 0x0000, 0x03FF, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x3FFF, 0xF000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0001, 0xFFFF, 0xFC00, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0007, 0xFFFF, 0xFC00, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x000F, 0xF007, 0xF800, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x003F, 0x8000, 0xF800, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x007E, 0x0000, 0x3800, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x00FC, 0x0000, 0x3800, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x01F8, 0x0000, 0x3000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x03F8, 0x0000, 0x3000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x07F0, 0x0000, 0x3000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0FE0, 0x0000, 0x0000, 0x00FC, 
  0x001E, 0x0038, 0x0000, 0xFC00, 
  0xFFF8, 0x3800, 0x00FE, 0x1800, 
  0x0FE0, 0x0000, 0x0000, 0x03FF, 
  0x007E, 0x01FC, 0x0003, 0xFF03, 
  0xFFF8, 0x7C00, 0x03FF, 0xFBB4, 
  0x1FE0, 0x0000, 0x0000, 0x0FFF, 
  0x01FE, 0x03FC, 0x000F, 0xFF07, 
  0xFFF0, 0xFE00, 0x07FF, 0xF13C, 
  0x1FC0, 0x0000, 0x0000, 0x3E3F, 
  0x83FE, 0x07FC, 0x003E, 0x3F87, 
  0xFFE0, 0xFE00, 0x1E0F, 0xF124, 
  0x3FC0, 0x0000, 0x0000, 0x781F, 
  0x87FE, 0x0FFC, 0x0078, 0x1F86, 
  0x01E1, 0xFE00, 0x3C07, 0xF124, 
  0x3FC0, 0x0000, 0x0000, 0xF81F, 
  0x9CFC, 0x19FC, 0x00F8, 0x1F8C, 
  0x01C1, 0x3E00, 0x7807, 0xF000, 
  0x3FC0, 0x0000, 0x0001, 0xF01F, 
  0x98FC, 0x21F8, 0x01F0, 0x1F8C, 
  0x0380, 0x1E01, 0xF807, 0xE000, 
  0x7F80, 0x0000, 0x0003, 0xF01F, 
  0x00FC, 0x41F8, 0x03F0, 0x1F08, 
  0x0780, 0x1E03, 0xF007, 0xE000, 
  0x7F80, 0x0000, 0x0007, 0xE03F, 
  0x00FC, 0x81F8, 0x07E0, 0x3F00, 
  0x0F00, 0x1E03, 0xF007, 0xE000, 
  0x7F80, 0x0000, 0x0007, 0xE03E, 
  0x00F9, 0x83F8, 0x07E0, 0x3E00, 
  0x1F00, 0x1C07, 0xE00F, 0xE000, 
  0x7F80, 0x0000, 0x000F, 0xE07E, 
  0x01FB, 0x03F0, 0x0FE0, 0x7E00, 
  0x3F00, 0x1C07, 0xE00F, 0xC000, 
  0x7F80, 0x03FF, 0xFE0F, 0xC0FC, 
  0x01FA, 0x03F0, 0x0FC0, 0xFC00, 
  0x3E00, 0x1C0F, 0xE01F, 0xC000, 
  0x7F80, 0x03FF, 0xFE0F, 0xC1F0, 
  0x01FE, 0x03F0, 0x0FC1, 0xF000, 
  0x7E00, 0x3C0F, 0xE01F, 0xC000, 
  0x7F80, 0x000F, 0xF01F, 0xC7C0, 
  0x01FC, 0x07E0, 0x1FC7, 0xC000, 
  0xFE00, 0x380F, 0xC03F, 0xC000, 
  0x7F80, 0x000F, 0xE01F, 0xFF00, 
  0x01FC, 0x07E0, 0x1FFF, 0x0000, 
  0xFC00, 0x381F, 0xC03F, 0x8000, 
  0x7F80, 0x000F, 0xE01F, 0xF000, 
  0x03F8, 0x07E0, 0x1FF0, 0x0000, 
  0xFC00, 0x701F, 0xC07F, 0x8000, 
  0x7FC0, 0x000F, 0xE03F, 0x8000, 
  0x03F8, 0x0FE0, 0x3F80, 0x0001, 
  0xFC00, 0x701F, 0xC0DF, 0x8000, 
  0x3FC0, 0x000F, 0xE03F, 0x8000, 
  0x03F0, 0x0FC0, 0x3F80, 0x0001, 
  0xFC00, 0x601F, 0x809F, 0x8000, 
  0x3FC0, 0x001F, 0xC03F, 0x8000, 
  0x03F0, 0x0FC0, 0x3F80, 0x0001, 
  0xFC00, 0xE03F, 0x81BF, 0x0000, 
  0x3FE0, 0x001F, 0xC03F, 0x8000, 
  0x07F0, 0x0FC0, 0x3F80, 0x0001, 
  0xFC00, 0xC03F, 0x833F, 0x0000, 
  0x1FE0, 0x001F, 0xC03F, 0x8002, 
  0x07E0, 0x1FC2, 0x3F80, 0x0201, 
  0xFC01, 0x803F, 0x863F, 0x0000, 
  0x0FF0, 0x001F, 0xC03F, 0x8006, 
  0x07E0, 0x1FC6, 0x3F80, 0x0601, 
  0xFC03, 0x003F, 0x8C3F, 0x1800, 
  0x07FC, 0x003F, 0x803F, 0xC01C, 
  0x0FE0, 0x1FCE, 0x3FC0, 0x1C01, 
  0xFE07, 0x003F, 0x987F, 0x3800, 
  0x03FF, 0x00FF, 0x803F, 0xE0F8, 
  0x0FE0, 0x1FF8, 0x3FE0, 0xF801, 
  0xFF0E, 0x003F, 0xF87F, 0xF000, 
  0x01FF, 0xFFFF, 0x001F, 0xFFE0, 
  0x0FC0, 0x1FF0, 0x1FFF, 0xE000, 
  0xFFFC, 0x003F, 0xF07F, 0xC000, 
  0x007F, 0xFFF0, 0x001F, 0xFF80, 
  0x0FC0, 0x1FC0, 0x1FFF, 0x8000, 
  0x7FF0, 0x003F, 0xC07F, 0x8000, 
  0x000F, 0xFE00, 0x000F, 0xFE00, 
  0x1FC0, 0x1F80, 0x0FFE, 0x0000, 
  0x7FE0, 0x001F, 0x807E, 0x0000, 
  0x0000, 0x0000, 0x0003, 0xF000, 
  0x1C00, 0x1E00, 0x03F0, 0x0000, 
  0x1F00, 0x000E, 0x0038, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0008, 0x0000, 0x0000, 
  0x8000, 0x0000, 0x0000, 0x0000, 
  0x0800, 0x0000, 0x0000, 0x0000, 
  0x780F, 0x0018, 0x0000, 0x0001, 
  0x8000, 0x0000, 0x0080, 0x0000, 
  0x1800, 0x0000, 0x0000, 0x0000, 
  0x180C, 0x0008, 0x4108, 0x0000, 
  0x8040, 0x0000, 0x0080, 0x0000, 
  0x0840, 0x0002, 0x0800, 0x0000, 
  0x1414, 0x0008, 0x4008, 0x0000, 
  0x8000, 0x0000, 0x0140, 0x0000, 
  0x0800, 0x0002, 0x0000, 0x0000, 
  0x1414, 0x0008, 0x4008, 0x0000, 
  0x8000, 0x0000, 0x0140, 0x0000, 
  0x0800, 0x0002, 0x0000, 0x0000, 
  0x1414, 0x2108, 0xF11E, 0x7870, 
  0x8C42, 0xE1E0, 0x0220, 0xBC2F, 
  0x0843, 0xC3C7, 0x883C, 0x2E00, 
  0x1224, 0x6308, 0x4308, 0x8488, 
  0x90C7, 0x121C, 0x0221, 0xC671, 
  0x88C4, 0x2422, 0x1846, 0x7100, 
  0x1224, 0x2108, 0x4108, 0x3C80, 
  0xA042, 0x1210, 0x07F0, 0x8220, 
  0x8844, 0x21E2, 0x0882, 0x2100, 
  0x1144, 0x2108, 0x4108, 0x4470, 
  0xE042, 0x1210, 0x0410, 0x8220, 
  0x8844, 0x0222, 0x0882, 0x2100, 
  0x1144, 0x2108, 0x4108, 0x8408, 
  0x9042, 0x11E0, 0x0808, 0x8220, 
  0x8844, 0x0422, 0x0882, 0x2100, 
  0x1084, 0x2308, 0x4108, 0x8C88, 
  0x8842, 0x1100, 0x0808, 0xC431, 
  0x0844, 0x2462, 0x08C4, 0x2100, 
  0x7C9F, 0x1D9C, 0x3386, 0x7671, 
  0xC4E7, 0x19F8, 0x1C1C, 0xB82E, 
  0x1CE3, 0xC3B1, 0x9C78, 0x7180, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0208, 0x0000, 0x8020, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0208, 0x0000, 0x8020, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0210, 0x0000, 0x8020, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x01E0, 0x0001, 0xC070, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x000F, 0xF800, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0002, 0x0800, 
  0x0020, 0x0000, 0x0000, 0x0000, 
  0x0200, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0002, 0x0800, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0200, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0002, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x0000, 
  0x0200, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0002, 0x20B8, 
  0xEE21, 0x63C2, 0xE173, 0x8785, 
  0xC780, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0003, 0xE1C4, 
  0x4463, 0xA467, 0x138C, 0x484E, 
  0x2200, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0002, 0x2084, 
  0x4421, 0x0822, 0x1108, 0x4844, 
  0x2200, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0002, 0x2084, 
  0x2821, 0x0822, 0x1108, 0x4FC4, 
  0x2200, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0002, 0x0884, 
  0x2821, 0x0822, 0x1108, 0x4804, 
  0x2200, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x0002, 0x0884, 
  0x1021, 0x0C42, 0x1108, 0x4844, 
  0x2200, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x0000, 0x000F, 0xF9C6, 
  0x1073, 0x8787, 0x1B9C, 0x678E, 
  0x3180, 0x0000, 0x0000, 0x0000
};

BITBLK rs_bitblk[] =
{ RSBB0DATA,  24,  74,   0,   0, 0x0001
};

OBJECT rs_object[] =
{ 
  /******** Tree 0 DESK ****************************************************/
        -1,       -1,       -1, G_BOX             ,   /* Object 0  */
  LASTOB, NORMAL, (LONG)0x00001143L,
  0x0000, 0x0000, 0x0034, 0x0009,
  
  /******** Tree 1 WIND ****************************************************/
        -1, WCLOSE          , WSIZE           , G_IBOX            ,   /* Object 0  */
  NONE, SHADOWED, (LONG)0x00011100L,
  0x0000, 0x0000, 0x0234, 0x0C12,
  WMOVE           ,       -1,       -1, G_BOXCHAR         ,   /* Object 1 WCLOSE */
  SELECTABLE, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\005' << 24)|0x00011100L,
  0x0000, 0x0000, 0x0302, 0x0301,
  WICONIZ         ,       -1,       -1, G_BOXTEXT         ,   /* Object 2 WMOVE */
  NONE, NORMAL, (LONG)&rs_tedinfo[0],
  0x0202, 0x0000, 0x042B, 0x0301,
  WBACK           ,       -1,       -1, G_BOXCHAR         ,   /* Object 3 WICONIZ */
  SELECTABLE, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\177' << 24)|0x00011100L,
  0x042D, 0x0000, 0x0302, 0x0301,
  WFULL           ,       -1,       -1, G_BOXCHAR         ,   /* Object 4 WBACK */
  SELECTABLE, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\256' << 24)|0x00011100L,
  0x052F, 0x0000, 0x0302, 0x0301,
  WILEFT          ,       -1,       -1, G_BOXCHAR         ,   /* Object 5 WFULL */
  SELECTABLE, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\007' << 24)|0x00011100L,
  0x0731, 0x0000, 0x0302, 0x0301,
  WINFO           ,       -1,       -1, G_BOXCHAR         ,   /* Object 6 WILEFT */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\004' << 24)|0x00011100L,
  0x0000, 0x0201, 0x0302, 0x0301,
  WIRT            ,       -1,       -1, G_BOXTEXT         ,   /* Object 7 WINFO */
  NONE, NORMAL, (LONG)&rs_tedinfo[1],
  0x0202, 0x0201, 0x062F, 0x0301,
  WTOOLBOX        ,       -1,       -1, G_BOXCHAR         ,   /* Object 8 WIRT */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\003' << 24)|0x00011100L,
  0x0731, 0x0201, 0x0302, 0x0301,
  WMNLEFT         ,       -1,       -1, G_IBOX            ,   /* Object 9 WTOOLBOX */
  NONE, NORMAL, (LONG)0x00011100L,
  0x0000, 0x0402, 0x0234, 0x0301,
  WMENU           ,       -1,       -1, G_BOXCHAR         ,   /* Object 10 WMNLEFT */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\004' << 24)|0x00011100L,
  0x0000, 0x0603, 0x0302, 0x0301,
  WMNRT           ,       -1,       -1, G_BOX             ,   /* Object 11 WMENU */
  NONE, NORMAL, (LONG)0x00011170L,
  0x0202, 0x0603, 0x062F, 0x0301,
  WUP             ,       -1,       -1, G_BOXCHAR         ,   /* Object 12 WMNRT */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\003' << 24)|0x00011100L,
  0x0631, 0x0603, 0x0302, 0x0301,
  WVBIGSL         ,       -1,       -1, G_BOXCHAR         ,   /* Object 13 WUP */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\001' << 24)|0x00011100L,
  0x0631, 0x0804, 0x0302, 0x0301,
  WDOWN           , WVSMLSL         , WVSMLSL         , G_BOX             ,   /* Object 14 WVBIGSL */
  NONE, NORMAL, (LONG)0x00011111L,
  0x0631, 0x0A05, 0x0302, 0x0204,
  WVBIGSL         ,       -1,       -1, G_BOX             ,   /* Object 15 WVSMLSL */
  NONE, DRAW3D|STATE12|STATE15, (LONG)0x00011101L,
  0x0000, 0x0401, 0x0302, 0x0602,
  WVSPLIT         ,       -1,       -1, G_BOXCHAR         ,   /* Object 16 WDOWN */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\002' << 24)|0x00011100L,
  0x0631, 0x0B09, 0x0302, 0x0301,
  WUP2            ,       -1,       -1, G_BOX             ,   /* Object 17 WVSPLIT */
  NONE, NORMAL, (LONG)0x00011100L,
  0x0000, 0x0F0A, 0x0234, 0x0600,
  WVBIGSL2        ,       -1,       -1, G_BOXCHAR         ,   /* Object 18 WUP2 */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\001' << 24)|0x00011100L,
  0x0631, 0x040B, 0x0302, 0x0301,
  WDOWN2          , WVSMLSL2        , WVSMLSL2        , G_BOX             ,   /* Object 19 WVBIGSL2 */
  NONE, NORMAL, (LONG)0x00011111L,
  0x0631, 0x060C, 0x0302, 0x0204,
  WVBIGSL2        ,       -1,       -1, G_BOX             ,   /* Object 20 WVSMLSL2 */
  NONE, DRAW3D|STATE12|STATE15, (LONG)0x00011101L,
  0x0000, 0x0401, 0x0302, 0x0602,
  WLEFT           ,       -1,       -1, G_BOXCHAR         ,   /* Object 21 WDOWN2 */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\002' << 24)|0x00011100L,
  0x0631, 0x0710, 0x0302, 0x0301,
  WHBIGSL         ,       -1,       -1, G_BOXCHAR         ,   /* Object 22 WLEFT */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\004' << 24)|0x00011100L,
  0x0000, 0x0911, 0x0302, 0x0301,
  WRT             , WHSMLSL         , WHSMLSL         , G_BOX             ,   /* Object 23 WHBIGSL */
  NONE, NORMAL, (LONG)0x00011111L,
  0x0202, 0x0911, 0x0715, 0x0301,
  WHBIGSL         ,       -1,       -1, G_BOX             ,   /* Object 24 WHSMLSL */
  NONE, DRAW3D|STATE12|STATE15, (LONG)0x00011101L,
  0x0603, 0x0000, 0x0306, 0x0301,
  WHSPLIT         ,       -1,       -1, G_BOXCHAR         ,   /* Object 25 WRT */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\003' << 24)|0x00011100L,
  0x0717, 0x0911, 0x0302, 0x0301,
  WLEFT2          ,       -1,       -1, G_BOX             ,   /* Object 26 WHSPLIT */
  NONE, NORMAL, (LONG)0x00011100L,
  0x011A, 0x0804, 0x0600, 0x040E,
  WHBIGSL2        ,       -1,       -1, G_BOXCHAR         ,   /* Object 27 WLEFT2 */
  SELECTABLE|TOUCHEXIT, DRAW3D|STATE11|STATE12|STATE15, (LONG) ((LONG)'\004' << 24)|0x00011100L,
  0x051A, 0x0911, 0x0302, 0x0301,
  WRT2            , WHSMLSL2        , WHSMLSL2        , G_BOX             ,   /* Object 28 WHBIGSL2 */
  NONE, NORMAL, (LONN�   P  D  <      &�        /
/$Hp\N�    &H gRK K` J&_$_NuH� >YO�� y    2( B <   N�    .�f3���    ` TK�    M�    0.~g  �Bn~(U` LN�    R���f� m��fB( r�? m��RHN�    A�  ��/  NN�    Пм   	2N�    $H 
gl ��"UN�     L��C� (IC�    LN�    "N\L LN�     NN�    R���&m��RK`  fBRK  g�`�f�B�� m��� *�/C�    ��pN�    XO(@ 
g JN�     oJ)W )|    )N �)m�� � y    9h B � y    A� N)H �)|���� �Bl � y    !@ �p`3�    B@XOL�| Nu/
/$Hp.N�    &H f JN�    G� `�   ��r��n�&_$_NuH� <$H*I(o G�    px"J SA� �N�     <   �"M SA�5N�    H� S��B(6 g L`A�    "S#H�(SI� �p ��*J- : fTM Ma   "H LpN�    B,  La   L�< NuH� 89    gj$y    G�    `R0* N�y    fD(S&�BApN�    J@g. <  �C� T SA� TN�     SB( � SBh NBy     SB� �&�`$R 
f�B9    L� NuH�>YO.�,I*o (9    f  �E�    &R6+ N7|�� NI�    p�y   f9    gt`BBl� �| �J�J�l BAB@N�    J@g  �p2"L RA� TN�     RrpN�    8, p�l�| JDgz`z R h 20N�    0N�     g M`
 R"h  i�/"N o a   XON�     R0h� r�| �H�H�h rJDgN�     RB� �By    7C NXOL�|8NuH�86 9    f  �E�     g  Ȱ�    g  �G�    9    f& S"P��    fr RҨ �"A S �N�    B9    9    j R��    f�     9    gr?BB R0( B2N�    TO`N R ( �f4(h r?BB0( B2N�    TO`(l  , f� L#�    N�    ` S"P ) $f(R#l � $L�Nu/&I"y    C� �N�    "y    C�5 KN�    p&_NuH�8&H$I(o B� g8 LN�    & `(0H�"L KN�    J@f
A�0 $�p` KN�    R���f�B@L�Nu/&H/	 y     h�"Ka   XOp&_Nu//YO&H(I/C�  y    a   XO g @f.� &W W ,g
 ;gf4 ��"L KN�    J@f W��/ LN�    ��f K`&Wf��`RKR�`�XO(_&_NuH�0$Hg0* : fH��| _�|��N�    TJ Ja   &HB JN�    �L�NuA�    a   Nu??O���86>�Bo �| )f
0A�N�    ?D 
tA�r0?@ N�    O� 86NuH� $H6 8p�N�    j  Jf4* B2p)a   p�j LfJDg4* B2p2a   L�Nu/
$y    ` Jp2N�     Jp)N�    $R 
f�By    B�    $_Nu/
UO9    jp`8A�    N�    $H 
fE�    0* r�h�| gA�pN�    0`0<�TO$_Nu9    g649    g.�< �d�< c�|qf9    op y    1@`�    NuB NuH�>O���6 :8*H/I 4a   J f zG� 0M�    E�    5C|�|qfVHy   	"K y    a   XOJ@g F%Mv%o 4r5D�K�� Sa   %H�"S N%H�N�     Na   B/|     4`�< �e�< �b�| �`2�|qg�|qf6< ` �|qf6<`�|qf#�        ` ʶ< c�< f "09    f � y    ��    gN�     o 4��g&"HA� x#�    N�     o 4f^"y    B) `Rr�? o 6RHN�    м   �2N�    #�    f#�        ` 6 y    ���"o 4RI y    RHN�    0�|� g"MA��p(N�    "j� JN�    `
"M JN�    f
B9    ` �* : gp\ JN�     g Ja   p.N�     f  �Hy   "K y    a   XO0�| g j�`��/H ,/B�"JN�    POJ@fPHy   "K y    a   XO/B�"J o 4N�    POJ@f&Hy   #"K y    a   XO/B�"J o 4N�    PO JN�    0�| g j�g"H NN�     Na   g@`0��N�    (HN�    �< A�| : B@A� N�     LN�    C�   + NN�    0�| g
"*�g A` y    #�    | pB@�| 
b ��@0; N�   ~�j����<��p. JN�    (H gX Ja   ��eNHy   -RL"LA�   #a   XO f  Hy   5"LA�   a   XO gBE`Hy   ="LA�   a   XOzJEf  �Jf g  � y    2( rt�i�| g  �Hy   I"K y    a   XOJ@g  �"J y    RHN�     o 4g(C�   Q y    RHN�    "o 4RI y    RHN�     y    RHN�    , �| ~l`p� y    �"S JN�    p5@~5@zB*p#�         y    0( rr�h�| gt`t��    `>B*p5Ez#�         y    0( rr�h�| gt`t��    jB@`05@~a   ` �JEfa   ` �3� <    �| g�| g�|��f �9    g �JEjr�`r3�    BF,y    `$��    g09    k2. J�@f
p�n LfRF,V f�JFgA�   SpN�    U@f
By    ` B,y    `\p�. �g NBApN�    ��    g>09    k2. J�@f
rp2 Na   n  f y    .�` o .�N�    /W f�,V f�#�        ` �JDf�y    g �3�    `$�| f �p�N�    �@g �3�    3�     3� =    z�` ��,y    `.��    g$n  Jg. �gU PgBB Mr0. BN�    ,V f�` J0J@gS@gS@g :` 20*��` 0(MA� &�` SR���< =gf� SR�BHo "K y    a   XOJ@g@ SN�     SC�/I ,p 0*�� y    �� ��/ A� N�     S��"o 0 N�    g �2*��gl(y    ` LN�    R���f� MN�    A�p 0*��"y    ����cX&�    2*���| p 0 KN�    J@f P L��    "S��(I#�    `r� <   N�    (H g $#�    j ��"M LN�     LN�    B4` 0*��fB��p��D`  �j��c0*��`0r 2  "y     MN�    �j��eB@`0*���D`  � y    1E L`  �0�| gl�| g
�| g&`  � 9    g  � @4( BBA09    N�    ` �� 9    gb"MA� pN�    ?|�� BBA� r"y    0) B?@ 
N�    `4p"MA� N�    0/ N�    /H gBBBA0/ N�    J@fB@`pO� 8L�|xNuH�8YO.�6 "9    g
9    f  �E�    A� "y    \I � �0�G�     S0( 5@ ,5@ 5h  p��y    5@ . Wa   (H%H��` am
 zn _RLf� S!J �By     S?( ?( ?( 4( r0�� JN�    \OXOL�Nu/
/$H9    gJ9    gJG�     
f&+ R+ Jfp�N�    6�B@N�     |   `8S+ f0gN�    `9    g��` 
f$y     y     P"y    "�&_$_Nu/
/E�    G�    Rqf#�    0* "j�� j��N�    `  vRqf#�    `fRqf
 S (  �`V0�| g:9    g S"h �#j 
 �`$ * 
"<   N�     S1@ t Sh�� r h @ r0�| g S"h �3j  �&_$_Nu/9    f<�      < ��NB& �| o$�|�l <QBAKNB& g��QBAKg
rҀ A0� &NuH�>O���E�    I�    9    o  �a    JN�    &H fG�    * �}e&* �}b0*|�|� g"KA�p2N�    /j� G�B9    A�    a   *pgn*TN�     JN�    ,H g<"T6) Bjq|g
0��N�    "N MN�    J@f �49    2- B0N�    `49    2- Bp�N�    a   B@` �BA0+ t�h�| N�    J@g bp2"K TA� TN�    9    fBA��pN�    BD09   �H�| gP9    gH4+ p�j�| f:jq|gA�   �pN�    S@g S@gS@g`( T (  �`x3���    `0+ r�h�| N�    JDfN9    f82*zgA�  AN�    B@ Ja   `*BA��0< N�    A�  DN�    `BA��0<�N�     T6( B*HJDfPa   J@gHa    m �/( ,"y     Ja   XO��0N�    a   B9    N�     m �N�    J@j<3�    BB29    0N�     f(�    `49     T2( Bp�N�    By    a   pO� 2L�|NuH�O���&H8 C�    A�N�    C�  IA�N�    B@A�N�    & JCj,C�  U/	A� a   "_N�    B@A�N�    & JCjB@`*JDo K2H�0N�    t2p N�    ( 0N�    0O� xL�NuH��B@NuH�8$H(I&H ,g
 ;gf$&
��0H�"K LN�    B40 f��`A� `RJ`�L�Nu//O���&H"KI� LN�    , : gN�    �< A�� :`�� \gB@ KN�     KN�    ��� \pC�  a LN�    J@fRL`pC�  c LN�    J@fTL"L KN�    O� x(_&_NuH�>O���(H*I&o0$o4BCB f"f$
fx`BD��a   .� gN�    < B@A� N�     La   N�    /H A�    N�    M� �p\ MN�     f- : f,�    &N f0Hy  f"N y    a   XOJ@fC�  f Na    f,�    &NM� � 
g 
 Ma   p.N�     g  ���`  �Jf
"N Sa   &� NN�    . JGg6 \p�gC�   + NN�    pC�  c NN�    J@fC�  NN�    "M NN�     
gC�  a NN�     NN�    A�  /H | 
g"J`C�    /I �`0"o | o �a   /H �p' NN�    J@f"N MN�    v / �gJCg� f$Jf&Jg"z"y    C� � NN�     Na   BJCg � o N�     gH�N�    A� N�     Wa   0O�L�|�NuB�B�"H��a   PONu                �  ��  ��          C          ����                           ARGV= SHOWHELP= GEMEXT= TOSEXT= ACCEXT= \ ACC,ACX TOS,TTP PRG,APP,GTP TOSRUN=   [1][One or more applications|will not know they are|being shut down.|Continue anyway?][C[ontinue|[Cancel] [3][This is a singletasking|application. Either it|or all other applications|must be put to sleep.][Sleep [All|Sleep [This|[Cancel] f Ee NEWDESK.INF DESKTOP.INF . .\ PATH=  ��  

 V �
 � 0 7
 l � �$ � � 0 \  [ [ �< 
 W E  � � � 7 q
 � � z � ; ; & 

 ; q 2  A � ' a \ _ 
  g
 � S . /$ a \ <& < :  z    _ D g
 � O
 Y N > %  �
 �
 � N H" H O � M �
 [ � [
 p � ] � � � p
 @ m p0 ] �$ = G
 
 j  ` = f w   � f f + A �
 � ! 5 ) � � } ~ � I �  �
 �
 
  I K �  m p  
 [ 
 @ � ? !
 u P E u [ u � 0 u P u
 u u [ \ [ [
 � � 
 �  m p  ,  m p ,  m p ,
  [ 
 " F i "  v m l< V 
 
  @   @   @ �  m p u [  u v u v u � u [ � � � � � � � � ) +
 � / ! A � !$  Q
 !
 A < � !  c * � 5 9
 6 s  6 � A �& T m p � m � \ m
 � � m m | m m 0 m [ �6 m \ �& 5 � �
  \   \
 B J   /
 4
 3 c  
( X  k " N �  r
 r r & d Y Y ^ � � ? e   &  �2 � 
 < R
 � � �
 � } ~& \ � K =  n o
 1 7 h 7 h  a \ / Z . /  Q" 7 :
 /  �
    �  �  u z
 � ^  
 {
 7 7  
 A 7 h _  $ ` [  v
   
 [
  U 8
 ( #
 t( ;  b [ F  i �  ]  ] [ ,0 "
 F i = 
 �  �   m p
  �  
 � t �  v  ] [
 v
  v �  t T [  � [ 
  G
 j " L
 ,��	    x   4$ x u  P l  ��	    l��	    � �x P� -    � C y 	( O
 
  
 ��in_scold_domw9_fixed   _shel_write_graf_mouse_appl_writeshwrcmdpathendnew_vidloop_idsh_execsw_hlptopic	new_flagsdo_frksw_grin_t2
shel_rpath	shel_disp	shell_appmenu_hFgetdtaFsetdta	block_appdo_sigtop_menu
sw_hlpfile	send_termhas_menuFopen__x_appl_termunloadshel_contextshel_putshel_get	ring_bellhas_mintfrk_idFclose
child_apid	close_del
bad_unload
_shel_findsw_accsettings	multitasklallocgo_acc	fix_pfork	dflt_desk	blankdeskunloadernew_rezload_errFseekcur_rez	set_multistrncpyto_sleep	shel_pathmagic_bphelp_app	env_matchapp0find_windowsw_argv	terminatelfreeDgetdrvDsetdrv_x_appl_termswrite_waitscroll_wdialsw_dflt	shel_find	shel_readpreemptlast_parent_sw_tail_form_alert	shel_execnoflagsFsfirstFreadstrrchrPexecdesk_objbp_addrtoggle_multistrcpymemcpystrncmpodd_exlock_curapploadpathinit_aphfix_pathdesktopcurr_bp_x_helpterm_msgsleepingexit_msgDgetpathDsetpath
_objc_drawsw_envenvironacc_runac_open_shel_envrnpad_acc_namePdomainVsetmodeshel_splitlistsw_tailstrcatfind_menu_idblankted
sw_hlpsensset_execmy_pexeclrealloc
find_flags
dflt_flagsstruprstrchrCconws_menu_registershel_dta	fix_warp9sw_exsw_path
shel_setup
set_curappsw_appnewtopcurappsw_flagfind_free_apnodel_all_msgstrlen
shel_envrn
env_buflen_ldivunload_type
mint_preemQDB2     �  6  X     �  *%>�  	     
     "   �         �    �   �   ) 8

�
     q     6   �         z     �   �    
     2     |      �                *
      D     �  =    & 
     M     ,  V         p     R  ]    �	     �       q         @     ~  w    
(
     =     @  �    
            �    
     f     B  �    
          D  �    
     +     4  �   	 
�
     )     N  �   	 
     I     B  �    *         �  �   � 	





&


*

,@$


 
,
�

��

�
�.
"


          �  �    
�"     "     �      


     ^     �  4         �     J  N    *
     R    �  ]   > 

$




     $     �  �    
     #     
  �    	     t     H  �   
      b     �      



     ,    
     0 

$ 

�
�



     L       d                        
   
       
                                     �      �          �       
   �          �          
          �                 
   �  0     �  0   
  �  0     m  @     �  @     z  @      
          �                    �  0     �  @      �                   z  @     �           �            �   
   
          �       	     �     �                    �         �         �          �                          
  z  �      m  @     �  @     �  @      �  @     �  @     �  0   
  �  0   
  z  @      �  �   
  �  @      �  �      �  �     z  `      �  `      z  �     z  @     �  0     �  p     �       ,          0                �     �   �       �       4  �         �  @     �  @     �  @     �  �   	  �  �     �         �  @     �          �         �  @     �   �     �   �   
  �   `     z  @     �        �  0     �  `      �  �     �  @     �  @      m  @     �   �     �   `     �  @     �  �      �  @     z         �  @      z         �         z  @     �       