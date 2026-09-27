// P-01 Blinking LED
// LED long leg -> pin 13, short leg -> GND

const int LED = 13;

void setup() {
  pinMode(LED, OUTPUT);
}

void loop() {
  digitalWrite(LED, HIGH);  // on
  delay(1000);
  digitalWrite(LED, LOW);   // off
  delay(1000);
}
