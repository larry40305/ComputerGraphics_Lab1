public void CGLine(float x1, float y1, float x2, float y2) {
    // TODO HW1
    // You need to implement the "line algorithm" in this section.
    // You can use the function line(x1, y1, x2, y2); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).
    // For instance: drawPoint(114, 514, color(255, 0, 0)); signifies drawing a red
    // point at (114, 514).

    /*
     stroke(0);
     noFill();
     line(x1,y1,x2,y2);
    */
    
    float dx = x2 - x1;
    float dy = y2 - y1;
    float steps = 20000;

    float x = x1;
    float y = y1;

    for(int i = 0; i <= steps; i++){
        drawPoint(x,y,color(0,0,0));
        x += dx / steps;
        y += dy / steps;
    }    
}

public void CGCircle(float x, float y, float r) {
    // TODO HW1
    // You need to implement the "circle algorithm" in this section.
    // You can use the function circle(x, y, r); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    circle(x,y,r*2);
    */
    
    float theta, cx, cy;

    int steps = 20000;
    for (int i = 0; i < steps; i++){
        theta = map(i, 0, steps, 0, TWO_PI);
        cx = x + r * cos(theta);
        cy = y + r * sin(theta);
        drawPoint(cx,cy,color(0,0,0)); 
    }
}

public void CGEllipse(float x, float y, float r1, float r2) {
    // TODO HW1
    // You need to implement the "ellipse algorithm" in this section.
    // You can use the function ellipse(x, y, r1,r2); to verify the correct answer.
    // However, remember to comment out the function before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    ellipse(x,y,r1*2,r2*2);
    */
    
    float theta, cx, cy;

    int steps = 20000;
    for (int i = 0; i < steps; i++){
        theta = map(i, 0, steps, 0, TWO_PI);
        cx = x + r1 * cos(theta);
        cy = y + r2 * sin(theta);
        drawPoint(cx,cy,color(0,0,0)); 
    }


}

public void CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) {
    // TODO HW1
    // You need to implement the "bezier curve algorithm" in this section.
    // You can use the function bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x,
    // p4.y); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    bezier(p1.x,p1.y,p2.x,p2.y,p3.x,p3.y,p4.x,p4.y);
    */

    float x,y;

    for(float t = 0; t < 1; t=t+0.00005){
        x = (1-t)*(1-t)*(1-t)*p1.x + 3*(1-t)*(1-t)*t*p2.x + 3*(1-t)*t*t*p3.x + t*t*t*p4.x;
        y = (1-t)*(1-t)*(1-t)*p1.y + 3*(1-t)*(1-t)*t*p2.y + 3*(1-t)*t*t*p3.y + t*t*t*p4.y;
        drawPoint(x,y,color(0,0,0));
    }
    
}

public void CGEraser(Vector3 p1, Vector3 p2) {
    // TODO HW1
    // You need to erase the scene in the area defined by points p1 and p2 in this
    // section.
    // p1 ------
    // |       |
    // |       |
    // ------ p2
    // The background color is color(250);
    // You can use the mouse wheel to change the eraser range.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).
    
    
    float dx = p2.x - p1.x;
    float dy = p2.y - p1.y;
    float steps = 50;

    float x = p1.x;
    float y = p1.y;

    for(int i = 0; i <= steps; i++){
        for(int j=0; j <= steps; j++){
            drawPoint(x,y,color(250));
            y += dy / steps;
        }
        x += dx / steps;
        y = p1.y;
    }

}

public void drawPoint(float x, float y, color c) {
    stroke(c);
    point(x, y);
}

public float distance(Vector3 a, Vector3 b) {
    Vector3 c = a.sub(b);
    return sqrt(Vector3.dot(c, c));
}
