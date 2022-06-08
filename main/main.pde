int JumlahBola = 20;
bola[] Bola = new bola[JumlahBola];

void setup(){
  size(700, 1000);
  for (int i = 0; i < JumlahBola; i++) {
      Bola[i] = new bola(random(150, 550), random(50, 150), 7.5, i, Bola);
  }
}

void draw(){
  background(255);
  // Lintasan Utama
  fill(#2D86DE);
  rect(150, 50, 400, 100); // Kotak tempat lubang masuk
  rect(50, 150, 600, 600); // Kotak yang berisi rintangan
    stroke(255);
    line(150, 150, 550, 150);
    stroke(0);
  rect(50, 750, 200, 200); // Kotak A
    stroke(255);
    line(50, 750, 250, 750);
    stroke(0);
  rect(250, 750, 200, 200); // Kotak B
    stroke(255);
    line(250, 750, 450, 750);
    stroke(0);
  rect(450, 750, 200, 200); // Kotak C
    stroke(255);
    line(450, 750, 650, 750);
    stroke(0);
   
  
  fill(#BDC6CE);
  // Rintangan baris ganjil
  for(int i = 70; i <= 630; i += 40){
    for(int j = 198; j <= 720; j += 72){
      circle(i, j, 20);
    }
  }
  // Rintangan baris genap
  for(int i = 50; i <= 650; i += 40){
    for(int j = 234; j < 738; j += 72){
      circle(i, j, 20);
    }
  }
  
  // Tindis lingkaran yang keluar dengan kotak
  fill(255);
  stroke(255);
  rect(0, 150, 50, 600);
  rect(650, 150, 50, 600);
  stroke(0);
  line(50, 150, 50, 750);
  line(650, 150, 650, 750);
  
  // Memanggil fungsi
  for(bola b : Bola){
    b.Bergerak();
    b.TabrakanBola();
    b.TabrakanRintangan();
    b.TabrakanDinding();
    b.Cetak();
  }
}
