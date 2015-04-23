import java.util.Collections;
import java.util.Arrays;
import java.util.ArrayList;

String[] dataRaw;
ArrayList data;
ArrayList tempData;
int windowHeight = 640;
int windowWidth = 1024;
int cellHeight;
int cellWidth;
int sampleSize = 10000;

void setup() {
    dataRaw = loadStrings("rgb.txt");
    data = new ArrayList();
    tempData = new ArrayList();
    tempData.addAll(Arrays.asList(dataRaw));
    Collections.shuffle(tempData);
    data.addAll(tempData.subList(0, sampleSize));
    cellHeight = windowHeight / 100;
    cellWidth = windowWidth / 100;
    
    size(windowWidth, windowHeight);
    stroke(255);
    frameRate(12);
}

void draw() {
    background(255);
    for (int i = 0; i < data.size(); i++) {
        for (int row = 0; row < 100; row++) {
            for (int col = 0; col < 100; col++) {
                String s = "" + data.get(i);
                int[] rgbVal = int(s.split(" "));
                color c = color(rgbVal[0], rgbVal[1], rgbVal[2]);
                fill(c);
                rect(cellWidth * col, cellHeight * row, cellWidth, cellHeight);
            }
        }        
    }    
}
