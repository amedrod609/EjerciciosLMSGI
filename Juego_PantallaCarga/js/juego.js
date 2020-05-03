

 //Variables para elementos e imágenes
 var canvas,
 ctx,
 imgPlayer,
 imgCactus,
 imgCloud,
 imgGameOver,
 imgCargadas = 0,
 counter = 0,
 esFinDeJuego = false;
 cacti = [],
 clouds = [];


//Variables para el jugador
var WIDTH = 50,
 HEIGHT = 50,
 ALTURA_DEFAULT = 250 - HEIGHT,
 x = 100,
 y = ALTURA_DEFAULT,
 vy = 0 ,
 gravity = 1;

//Variables para los obstáculos
class Cactus{
    constructor(){
        this.x = canvas.width;
        this.y = ALTURA_DEFAULT;
        this.vx = -7;
        this.imgSprite = imgCactus;
    }

    move(){
        this.x += this.vx;
    }
    paint(){
      ctx.drawImage(this.imgSprite, this.x, this.y, WIDTH, HEIGHT);
      /*ctx.fillRect(this.x - 50, this.y, 50, 50);*/
    }
}

class Cloud{
    constructor(){
        this.x = canvas.width;
        this.y = this.getRandomY();
        this.vx = -0.5;
        this.imgSprite = imgCloud;
    }

    getRandomY(){
        return Math.round(Math.random()*(120-80)+80);
    }
    move(){
        this.x += this.vx;
    }
    paint(){
      ctx.drawImage(this.imgSprite, this.x, this.y, 46, 14);
      /*ctx.fillRect(this.x - 50, this.y, 50, 50);*/
    }
}
//Punto de partida de la ejecución
function init(){
preloadImages();

//Obtener el canvas
 canvas = document.getElementById('canvas');
 //Obtener la brocha
 ctx = canvas.getContext("2d");

 document.addEventListener("keypress", jump);
 
 gameLoop()
}

function preloadImages(){
    imgPlayer = new Image();
    imgPlayer.src = 'res/dino_Sprite.png';
    imgPlayer.addEventListener('load', cargaAsincrona, false);

    imgCactus = new Image();
    imgCactus.src = 'res/Cactus_transp.png';
    imgCactus.addEventListener('load', cargaAsincrona, false);

    imgCloud = new Image();
    imgCloud.src = 'res/cloud.png';
    imgCloud.addEventListener('load', cargaAsincrona, false);

    imgGameOver = new Image();
    imgGameOver.src = 'res/Game_Over_transp.png';
    imgGameOver.addEventListener('load', cargaAsincrona, false);

}

function cargaAsincrona() {
    // Este trozo de código se ejecutará de manera asíncrona cuando la imagen se haya realmente cargado.
    imgCargadas++;
    paintGame();
}

function paintGame(){

    //Fill the background
    ctx.fillStyle = "#FFFFFF";
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    //Draw the horizon line
    ctx.beginPath();
    ctx.moveTo(0,240);
    ctx.lineTo(canvas.width, 240);
    ctx.lineWidth = 0.5;
    ctx.stroke();

    
    if (imgCargadas == 4) {
    paintPlayer();
    paintAndMoveItems()
       
    }
}

function paintPlayer(){

 ctx.drawImage(imgPlayer, x, y, WIDTH, HEIGHT);
}

function move(){
    y += vy;
    vy += gravity;
    if (y >= ALTURA_DEFAULT) {
        y = ALTURA_DEFAULT;
    }
   
}

function jump() {
    if (y == ALTURA_DEFAULT) {
        vy = -12;    
    }
    
}

function getTransitoryItems(){
    if (Math.random()<0.01) {
        cacti.push(new Cactus())
    }

    if (Math.random()<0.005) {
        clouds.push(new Cloud())
    }
}

function paintAndMoveItems(){
    //Move the cacti
    for (let i = 0; i < cacti.length; i++) {
        cacti[i].move();
        cacti[i].paint();
    }

    //Move the clouds
    for (let i = 0; i < clouds.length; i++) {
        clouds[i].move();
        clouds[i].paint();
    }
}

/**
 * Detele Clouds and cacti that are no longer in
 * the canvas
 */
function deleteUsedItems(){
   for (let i = 0; i < cacti.length; i++) {
    
    if (cacti[i].x < 0 - WIDTH) {
        cacti.shift();
    }   
   }
   for (let i = 0; i < clouds.length; i++) {
    
    if (clouds[i].x < 0 - WIDTH) {
        clouds.shift();
    }   
   }
}

/**
 * Checks for collisions using the obstacles coords
 * and the player coords
 * 
 * 
 */
function getCollisions() {
    for (let i = 0; i < cacti.length; i++) {
        if (cacti[i].x < x + WIDTH &&
            cacti[i].y < y + HEIGHT) {
            
                esFinDeJuego = true;
        }
        
    }
}

function gameEngine() {
    if (!esFinDeJuego) {
        window.requestAnimationFrame(gameLoop);
    }
    else{
        ctx.drawImage(imgGameOver, (canvas.width/2 - imgGameOver.width/2), (canvas.height/2 - imgGameOver.height/2) )
    }
}


/**
 * Main game loop, ends when a colision is detected
 */
function gameLoop(){



    

    move();
    getTransitoryItems();
    getCollisions();
    paintGame();

    deleteUsedItems();

    gameEngine();
}

