void setup() {
  size(1024, 768);
}

int font_size = 10;
int static_inc = 0;
float x_map_inc = 0;
float y_map_inc = 0;
int draw_increment = font_size + static_inc;


// Circunference
int center_x = -200;
int center_y = -200;
float radius = 100;
float radius_inc = 4;
float center_x_norm = center_x;
float center_y_norm = center_y;

int[] cfs_center_x = {};
int[] cfs_center_y = {};
float[] cfs_radius = {};

void draw() {
  background(255);
  textAlign(CENTER,CENTER);
  textSize(font_size);
  fill(0);
  x_map_inc = map(mouseX, 0, width, 0, 8);
  y_map_inc = map(mouseY, 0, height, 0, 8);
  for(int hor_pos = font_size/2; hor_pos < width; hor_pos += draw_increment) {
    for(int ver_pos = font_size/2; ver_pos < height; ver_pos += draw_increment) {
      boolean drawed = false;
      for(int cf_i = 0; cf_i < cfs_center_x.length; cf_i++) {
        int cf_x = cfs_center_x[cf_i];
        int cf_y = cfs_center_y[cf_i];
        float cf_r = cfs_radius[cf_i];
        float d = dist(hor_pos, ver_pos, cf_x, cf_y);
        if(abs(d - int(cf_r)) < draw_increment) {
          text(char(int(random(10)+50)), hor_pos, ver_pos);
          text(char(int(random(10)+50)), hor_pos, ver_pos);
          text(char(int(random(10)+50)), hor_pos, ver_pos);
          text(char(int(random(10)+50)), hor_pos, ver_pos);
          drawed = true;
        }
      }
      
      if(!drawed) {
        text(char(int(random(127))), hor_pos, ver_pos);
      }
      drawed = false;
    }
  }
  
  for(int cf_i = 0; cf_i < cfs_center_x.length; cf_i++) {
    cfs_radius[cf_i] += radius_inc;
  }
  
  // First normalize in terms of the font_size + increment
  center_x_norm = mouseX - (mouseX % (draw_increment)) + font_size/2;
  center_y_norm = mouseY - (mouseY % (draw_increment)) + font_size/2;
  // "Draw" the circunference with symbols
  fill(150,0,0);
  ellipse(center_x_norm, center_y_norm, font_size, font_size);
}

void mousePressed() {
  center_x = mouseX - (mouseX % (draw_increment)) + font_size/2;
  center_y = mouseY - (mouseY % (draw_increment)) + font_size/2;
  radius = 0;
  cfs_center_x = append(cfs_center_x, center_x);
  cfs_center_y = append(cfs_center_y, center_y);
  cfs_radius = append(cfs_radius, radius);
}
