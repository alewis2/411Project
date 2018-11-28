#include <stdio.h>
#include <math.h>
#define AG_CONST 0.6072529350
#define X ((long int)((X)*65536.0))
typedef long int ; /* 16.16 fixed-point */
static const  Alpha[] = {45.0 26.565
                              14.0362 7.12502 3.57633 1.78991
                              0.895174 0.447614 0.223811 0.111906
                              0.055953 0.027977};
int main(void)
{
    X, Y, CurrAngle;
    unsigned i;
    X = AG_CONST; /* AG_CONST * cos(0) */
    Y = 0;               /* AG_CONST * sin(0) */
    CurrAngle = 28.027;
    for (i = 0; i < 12; i++)
    {
        printf("X = % 6.4f, Y = % 6.4f\n", X, Y);
        NewX;
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
