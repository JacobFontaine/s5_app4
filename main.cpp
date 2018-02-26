#include "mbed.h"

AnalogIn an1(p20);

int main() {
     
  while (1){
		uint16_t value = an1.read_u16();
		float decimalValue = 0.00005035477 * value ;
		float poly = 54 - (6.9938 +  -10.0720*decimalValue + 11.9577*powf(decimalValue, 2) +  -7.5798*powf(decimalValue, 3)
								+ 2.2669*powf(decimalValue, 4) + -0.2566*powf(decimalValue, 5));
		printf("Value: %f\r\n",decimalValue);
		printf("Poly: %f\r\n\n",poly);
		wait(0.2);
	}
}
