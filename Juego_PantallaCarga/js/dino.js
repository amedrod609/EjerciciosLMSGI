class Dino {

    constructor(){
        this.x = 50;
        this.y = 100;
        this.vy = 0;
        this.gravity = 5;
    }

    jump(){
        this.vy = -10;
    }

    move(){
        this.y += this.vy;
        this.vy += this.gravity;
    }

    draw(canvas){
        ctx = canvas.getContext("2d");
        ctx.fillStyle = "green"
        cxt.fillRect(this.x, this.y, 25, 25);
    }

}