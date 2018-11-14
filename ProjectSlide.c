#include <stdio.h>
#include <math.h>
#define AG_CONST 0.6072529350
#define fixed(X) ((long int)((X)*65536.0))
typedef long int fixed; /* 16.16 fixed-point */
static const fixed Alpha[] = {fixed(45.0), fixed(26.565),
                              fixed(14.0362), fixed(7.12502), fixed(3.57633), fixed(1.78991),
                              fixed(0.895174), fixed(0.447614), fixed(0.223811), fixed(0.111906),
                              fixed(0.055953), fixed(0.027977)};
int main(void)
{
    fixed X, Y, CurrAngle;
    unsigned i;
    X = fixed(AG_CONST); /* AG_CONST * cos(0) */
    Y = 0;               /* AG_CONST * sin(0) */
    CurrAngle = fixed(28.027);
    for (i = 0; i < 12; i++)
    {
        printf("X = % 6.4f, Y = % 6.4f\n", X, Y);
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
            Y -= (X >> i);
            X = NewX;
            CurrAngle += Alpha[i];
        } // if-else
    }     // for (i = …
    printf("cos(28.027) = % 6.4f, sin() = % 6.4f\n", X / 65536.0, Y / 65536.0);
} // main
