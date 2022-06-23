class bola{
  int JumlahBola = 3;
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  bola[] others;
  float spring = 0.1;
  float gravity = 0.01;
  float friction = -0.1;
  
  bola(float xin, float yin, float din, int idin, bola[] oin){
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  }

  void Bergerak(){
    vy += gravity;
    x += vx;
    y += vy;
  }

  void Cetak(){
    fill(204);
    circle(x, y, diameter);
  }

  void TabrakanBola(){
    for(int i = id + 1; i < JumlahBola; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }
  }

  void TabrakanDinding(){
    // Kotak Masuk
    if(x > 75 & y > 25 & x < 226 & y < 62){
      // Kiri
      if(x - diameter / 2 < 75){
        x = 75 + diameter;
        vx *= friction;
      }
      // Atas
      else if(y - diameter / 2 < 25){
        y = 25 + diameter / 2;
        vy *= friction;
      }
      // Kanan
      else if(x + diameter / 2 > 226){
        x = 226 - diameter / 2;
        vx *= friction;
      }
    }
    // Kotak Utama
    else if(x > 37.5 & y > 62 & x < 263.5 & y < 288){
      // Kiri
      if(x - diameter / 2 < 37.5){
        x = 37.5 + diameter;
        vx *= friction;
      }
      // Atas
      else if(y - diameter / 2 < 62){
        // Atas Kiri
        if(x > 37.5 & x < 75){
          y = 62 + diameter / 2;
          vy *= friction;
        }
        // Atas Kanan
        else if(x > 226 & x < 263.5){
          y = 62 + diameter / 2;
          vy *= friction;
        }
      }
      // Kanan
      else if(x + diameter / 2 > 263.5){
        x = 263.5 - diameter / 2;
        vx *= friction;
      }
    }
    // Kotak A
    else if(x > 37.5 & y > 288 & x < 112.5 & y < 363){
      // Kiri
      if(x - diameter / 2 < 37.5){
        x = 50 + diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Kanan
      else if(x + diameter / 2 > 112.5){
        x = 250 - diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Bawah
      else if(y + diameter / 2 > 363){
        y = 363 - diameter / 2;
        vy *= friction;
        vx *= 0;
      }
    }
    // Kotak B
    else if(x > 112.5 & y > 288 & x < 188.5 & y < 363){
      // Kiri
      if(x - diameter / 2 < 112.5){
        x = 112.5 + diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Kanan
      else if(x + diameter / 2 > 188.5){
        x = 188.5 - diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Bawah
      else if(y + diameter / 2 > 363){
        y = 363 - diameter / 2;
        vy *= friction;
        vx *= 0;
      }
    }
    // Kotak C
    else if(x > 188.5 & y > 288 & x < 263.5 & y < 363){
      // Kiri
      if(x - diameter / 2 < 188.5){
        x = 188.5 + diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Kanan
      else if(x + diameter / 2 > 263.5){
        x = 263.5 - diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Bawah
      else if(y + diameter / 2 > 363){
        y = 363 - diameter / 2;
        vy *= friction;
        vx *= 0;
      }
    }
  }
  
  void TabrakanRintangan(){
    // Rintangan baris ganjil
    for(float i = 37.5; i <= 263.5; i += 15){
      for(float j = 77; j <= 273; j += 30){
        float dx = i - x;
        float dy = j - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = random(2,4.8);
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - i) * spring;
          float ay = (targetY - j) * spring;
          vx -= ax;
          vy -= ay;
        }
      }
    }
    // Rintangan baris genap
    for(int i = 45; i <= 256; i += 15){
      for(int j = 92; j <= 288; j += 30){
        float dx = i - x;
        float dy = j - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = random(2,4.8);
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - i) * spring;
          float ay = (targetY - j) * spring;
          vx -= ax;
          vy -= ay;
        }
      }
    }
  }
}
