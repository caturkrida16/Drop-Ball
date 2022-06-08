class bola{
  int JumlahBola = 20;
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  bola[] others;
  float spring = 0.0075;
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
    // Kotak 1
    if(x > 150 & y > 50 & x < 550 & y < 150){
      // Kiri
      if(x - diameter / 2 < 150){
        x = 150 + diameter;
        vx *= friction;
      }
      // Atas
      else if(y - diameter / 2 < 50){
        y = 50 + diameter / 2;
        vy *= friction;
      }
      // Kanan
      else if(x + diameter / 2 > 550){
        x = 550 - diameter / 2;
        vx *= friction;
      }
    }
    // Kotak 2
    else if(x > 50 & y > 150 & x < 650 & y < 750){
      // Kiri
      if(x - diameter / 2 < 50){
        x = 50 + diameter;
        vx *= friction;
      }
      // Atas
      else if(y - diameter / 2 < 150){
        // Atas Kiri
        if(x > 50 & x < 150){
          y = 150 + diameter / 2;
          vy *= friction;
        }
        // Atas Kanan
        else if(x > 550 & x < 650){
          y = 150 + diameter / 2;
          vy *= friction;
        }
      }
      // Kanan
      else if(x + diameter / 2 > 650){
        x = 650 - diameter / 2;
        vx *= friction;
      }
    }
    // Kotak A
    else if(x > 50 & y > 750 & x < 250 & y < 950){
      // Kiri
      if(x - diameter / 2 < 50){
        x = 50 + diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Kanan
      else if(x + diameter / 2 > 250){
        x = 250 - diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Bawah
      else if(y + diameter / 2 > 950){
        y = 950 - diameter / 2;
        vy *= friction;
        vx *= 0;
      }
    }
    // Kotak B
    else if(x > 250 & y > 750 & x < 450 & y < 950){
      // Kiri
      if(x - diameter / 2 < 250){
        x = 250 + diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Kanan
      else if(x + diameter / 2 > 450){
        x = 450 - diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Bawah
      else if(y + diameter / 2 > 950){
        y = 950 - diameter / 2;
        vy *= friction;
        vx *= 0;
      }
    }
    // Kotak C
    else if(x > 450 & y > 750 & x < 650 & y < 950){
      // Kiri
      if(x - diameter / 2 < 450){
        x = 450 + diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Kanan
      else if(x + diameter / 2 > 650){
        x = 650 - diameter / 2;
        vx *= friction;
        vy *= 0;
      }
      // Bawah
      else if(y + diameter / 2 > 950){
        y = 950 - diameter / 2;
        vy *= friction;
        vx *= 0;
      }
    }
  }
  
  void TabrakanRintangan(){
    // Rintangan baris ganjil
    for(float i = 70; i <= 630; i += 40){
      for(float j = 198; j <= 720; j += 72){
        float dx = i - x;
        float dy = j - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = 20;
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
    for(float i = 50; i <= 650; i += 40){
      for(float j = 234; j < 738; j += 72){
        float dx = i - x;
        float dy = j - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = 20;
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
