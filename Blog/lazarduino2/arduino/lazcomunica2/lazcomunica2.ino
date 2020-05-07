void setup() {
  Serial.begin(9600);

}

void loop() {
   if (Serial.available())
  {
    String cadena = Serial.readStringUntil('\n');
    String enviar = "Hola, he recibido esto: " + cadena+'\n'; //Añadimos final de línea
    Serial.println(enviar);    
  }
}
