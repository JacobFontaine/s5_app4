#include "mbed.h"

AnalogIn an1(p20);

int main() {
     
  while (1){
		float value = an1.read()*3.3;
		float poly = 54 - (6.9938 +  -10.0720*value + 11.9577*powf(value, 2) +  -7.5798*powf(value, 3)
								+ 2.2669*powf(value, 4) + -0.2566*powf(value, 5));
		printf("Value: %f\r\n",value);
		printf("Poly: %f\r\n\n",poly);
		wait(0.2);
	}
}
