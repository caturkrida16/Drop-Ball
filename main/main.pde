int JumlahBola = 3;
bola[] Bola = new bola[JumlahBola];

void setup(){
  size(300, 400);
  for (int i = 0; i < JumlahBola; i++) {
      //Bola 1
    if(i == 0){
      Bola[i] = new bola(99.9, 25, 5.7, i, Bola);
    }
    // Bola 2
    else if(i == 1){
      Bola[i] = new bola(149.7, 25, 5.7, i, Bola);
    }
    // Bola 3
    else if(i == 2){
      Bola[i] = new bola(199.5, 25, 5.7, i, Bola);
    }
  }
}

void draw(){
  background(255);
  // Lintasan Utama
  fill(#2D86DE);
  rect(75, 25, 151, 37); // Kotak tempat lubang masuk
  rect(37.5, 62, 226, 226); // Kotak yang berisi rintangan
    stroke(255);
    line(75, 62, 226, 62);
    stroke(0);
  rect(37.5, 288, 75, 75); // Kotak A
    stroke(255);
    line(37.5, 288, 112.5, 288);
    stroke(0);
  rect(112.5, 288, 76, 75); // Kotak B
    stroke(255);
    line(112.5, 288, 188.5, 288);
    stroke(0);
  rect(188.5, 288, 75, 75); // Kotak C
    stroke(255);
    line(188.5, 288, 263.5, 288);
    stroke(0);
   
  
  fill(#BDC6CE);
  // Rintangan baris ganjil
  for(float i = 37.5; i <= 263.5; i += 15){
    for(float j = 77; j <= 273; j += 30){
      circle(i, j, 4.8);
    }
  }
  // Rintangan baris genap
  for(int i = 45; i <= 256; i += 15){
    for(int j = 92; j <= 288; j += 30){
      circle(i, j, 4.8);
    }
  }
  
  // Tindis lingkaran yang keluar dengan kotak
  fill(255);
  stroke(255);
  rect(0, 62, 37.5, 226);
  rect(263.5, 62, 36.5, 226);
  stroke(0);
  line(37.5, 62, 37.5, 288);
  line(263.5, 62, 263.5, 288);
  
  // Memanggil fungsi
  for(bola b : Bola){
    b.Bergerak();
    b.TabrakanBola();
    b.TabrakanRintangan();
    b.TabrakanDinding();
    b.Cetak();
  }
}
