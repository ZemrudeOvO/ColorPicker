//Colorpicker
PImage img;
PFont font;

void setup(){
    size(1140, 1000);
    noCursor();
    img = loadImage("lsl.png");

    font = loadFont("Dialog.vlw");
    textFont(font);
}

void draw(){
    func_init_BG();
    func_colorPick();
    func_hue_text();
    func_cursorRender();
}

void func_init_BG(){
    background(200);
    image(img, 0, 0);
}

color func_colorPick(){
    color pickedColor = get(mouseX, mouseY); 
    fill(pickedColor);   
    stroke(0);
    strokeWeight(5);
    rect(100, 100 ,100, 100);
    return pickedColor;
}

void func_hue_text(){
    String hueColor = "hue = " + str(int(hue(func_colorPick())));
    String saturationColor = "saturation = " + str(int(saturation(func_colorPick())));
    String brightnessColor = "brightness = " + str(int(brightness(func_colorPick())));
    
    fill(0);
    textSize(24);
    text(hueColor, 200, 120);
    text(saturationColor, 200, 160);
    text(brightnessColor, 200, 200);
}

void func_cursorRender(){
    fill(func_colorPick());
    stroke(0);
    strokeWeight(2);

    boolean left = mouseX<0.1 * width ? true:false;
    boolean right = mouseX>0.9 * width ? true:false;
    boolean top = mouseY<0.1 * height ? true:false;
    boolean bottom = mouseY>0.9 * height ? true:false;
    
    if (!right){
        if (!bottom){
            rect(mouseX + 40, mouseY + 40, 50, 50);
        }
        else{
            rect(mouseX + 40, mouseY - 40, 50, 50);
        }
    }
    else if (!bottom){
        rect(mouseX - 40, mouseY + 40, 50, 50);
    }
    else{
        rect(mouseX - 40 ,mouseY - 40, 50, 50);
    }
    
    rectMode(CENTER);
    fill(0);
    noStroke();
    rect(mouseX, mouseY, 30, 4);
    rect(mouseX, mouseY, 4, 30);
}
