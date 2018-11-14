#include <stdio.h>
#include <math.h>
#define AG_CONST 0.6072529350 #define FXD(X)((long int)((X)*65536.0))
typedef long int fixed; /* 16.16 fixed-point */
static const fixed Alpha[] = {FXD(45.0), FXD(26.565),
                              FXD(14.0362), FXD(7.12502), FXD(3.57633), FXD(1.78991),
                              FXD(0.895174), FXD(0.447614), FXD(0.223811), FXD(0.111906),
                              FXD(0.055953), FXD(0.027977)};
int main(void)
{
    fixed X, Y, CurrAngle;
    unsigned i;
    X = FXD(AG_CONST); /* AG_CONST * cos(0) */
    Y = 0;             /* AG_CONST * sin(0) */
    CurrAngle = FXD(28.027);
    for (i = 0; i < 12; i++)
    {
        fixed NewX;
        if (CurrAngle > 0)
        {
            NewX = X - (Y >> i);
            Y += (X >> i);
            X = NewX;
            CurrAngle -= Alpha[i];
        }
        else
        {
            NewX = X + (Y >> i);
            Y - = (X >> i);
            X = NewX;
            CurrAngle += Alpha[i];
        } // if-else
    }     // for (i = …
    printf(“cos(28.027) = % 6.4f, sin() = % 6.4f\n”, x / 65536.0, y / 65536.0);
} // main