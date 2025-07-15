Table table;
int nSamples;

float[] bmi;
float[] horasDeSueño;

void setup() {
  size(1000, 700);
  table = loadTable("addiction_population_data.csv", "header");
  nSamples = table.getRowCount();
  println("Filas leídas: " + nSamples);

  bmi = new float[nSamples];
  horasDeSueño = new float[nSamples];

  for (int i = 0; i < nSamples; i++) {
    bmi[i] = table.getFloat(i, "bmi");
    horasDeSueño[i] = table.getFloat(i, "sleep_hours");
  }
}

void draw() {
  background(#FFF8E3);
  strokeWeight(2);
  noFill();

  float MergenIzq = 50;
  float MargenDer = width - 50;
  float MargenArriba = 50;
  float MargenAbajo = height - 50;

  // máximo de ambas variables
  float maxBMI = max(bmi);
  float maxSleep = max(horasDeSueño);

  // Fila de BMI
  stroke(#B290CB);  // Azul
  beginShape();
  for (int i = 0; i < nSamples; i++) {
    float x = map(i, 0, nSamples - 1, MergenIzq, MargenDer);
    float y = map(bmi[i], 0, maxBMI, MargenAbajo, MargenArriba);
    vertex(x, y);
  }
  endShape();

  // Fila de horas de sueño
  stroke(#83D8C9);  // Naranja
  beginShape();
  for (int i = 0; i < nSamples; i++) {
    float x = map(i, 0, nSamples - 1, MergenIzq, MargenDer);
    float y = map(horasDeSueño[i], 0, maxSleep, MargenAbajo, MargenArriba);
    vertex(x, y);
  }
  endShape();

  // Ejes
  stroke(200);
  line(MergenIzq, MargenArriba, MergenIzq, MargenAbajo);        // Eje Y
  line(MergenIzq, MargenAbajo, MargenDer, MargenAbajo);    // Eje X

  // Título
  fill(0);
  textSize(18);
  textAlign(CENTER);
  text("Gráfico de líneas: BMI (azul) vs Horas de sueño (naranja)", width / 2, 30);
}
