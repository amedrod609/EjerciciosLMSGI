

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

/**
 * Class defined for the obstacles
 */
class Cactus{
    constructor(){
        this.x = canvas.width;
        this.y = ALTURA_DEFAULT;
        this.vx = -8;
        this.imgSprite = imgCactus;
    }

    /**
     * Change the position in every iteration
     * by substracting a defined quantity
     * of pixels
     */
    move(){
        this.x += this.vx;
    }
    /**
     * Paint the image previously loaded using ctx
     */
    paint(){
        //Uncomment to show hitboxes

        //ctx.fillStyle = "#fa8178"
        //ctx.fillRect(this.x, this.y, 50, 50);

        ctx.drawImage(this.imgSprite, this.x, this.y, WIDTH, HEIGHT);
    }
}

/**
 * Class defined for the moving clouds in the background
 * They behave the same way as the cactus
 */
class Cloud{
    constructor(){
        this.x = canvas.width;
        this.y = this.getRandomY();
        this.vx = -0.5;
        this.imgSprite = imgCloud;
    }

    //Returns a random number to give the clouds a bit more 
    //realism when they spawn
    getRandomY(){
        return Math.round(Math.random()*(120-80)+80);
    }

    //same as cactus, moves a bit every iteration
    move(){
        this.x += this.vx;
    }

    //Paints using dthe ctx object
    paint(){
      ctx.drawImage(this.imgSprite, this.x, this.y, 46, 14);
    }
}

//Punto de partida de la ejecución
function init(){
    //Asyncronous image loading
    //if this isn't done, there may be problems
    //with larger images
    preloadImages();

    //Obtener el canvas
    canvas = document.getElementById('canvas');

    //Obtener la brocha
    ctx = canvas.getContext("2d");

    //Detects the letter key pess and calls the function jump
    document.addEventListener("keypress", jump);
    
    //Begins the game loop
    gameLoop()
}

/**
 * Loads images from a local folder and increments a var
 * the images don't load if there is any problem loading them
 */
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

    //If all images al loaded, this paint every entity needed
    if (imgCargadas == 4) {
    
        paintAndMoveItems()
        paintPlayer();
    }
}

function paintPlayer(){

    //Uncomment to show hitboxes
    //ctx.fillStyle = "#6ea3cc"
    //ctx.fillRect(this.x, this.y, 50, 50);

    //Paints the given image
    ctx.drawImage(imgPlayer, x, y, WIDTH, HEIGHT);

}

/**
 * Moves de player up and down by adding the vy value
 * vy is 0 by default, so the player doesn't move
 * Up if the jump function is called, vy changes to a negative value
 * Down because vy is being added de value of gravity.
 * When jump is called moves fast upwards but it slowly decreases speed
 * acording to vy, until it reaches 0, the upper point and then goes down 
 */
function move(){
    y += vy;
    vy += gravity;
    if (y >= ALTURA_DEFAULT) {
        y = ALTURA_DEFAULT;
    }
   
}

/**
 * Changes the value of vy
 */
function jump() {
    if (y == ALTURA_DEFAULT) {
        vy = -15;    
    }
    
}

/**
 * Creates and pushes a new object in it's respective array
 * when a random number is under the given number
 * you can get more o less objects by changing the if condition
 */
function getTransitoryItems(){
    //Adds obstacles
    if (Math.random()<0.008) {
        cacti.push(new Cactus())
    }
    //Adds nice and decorative clouds
    if (Math.random()<0.001) {
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
    //Deletes obstacles
    for (let i = 0; i < cacti.length; i++) {
        
        if (cacti[i].x < 0 - WIDTH) {
            cacti.shift();
        }   
    }

    //Deletes nice and decorative clouds
    for (let i = 0; i < clouds.length; i++) {
        
        if (clouds[i].x < 0 - WIDTH) {
            clouds.shift();
        }   
    }
}

/**
 * Checks for collisions using the obstacles coords
 * and the player coords
 */
function getCollisions() {
    for (let i = 0; i < cacti.length; i++) {
        if (cacti[i].x + WIDTH > x &&
            cacti[i].x < x + WIDTH &&
            cacti[i].y < y + WIDTH) {
            
                esFinDeJuego = true;
        }
        
    }
}

//Calls the loop function or paints the Game Over image if the player loses
function gameEngine() {
    //Calls the loop
    if (!esFinDeJuego) {
        window.requestAnimationFrame(gameLoop);
    }
    //Paints Game Over
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

    //Coment to let the game run painlessly
    //getCollisions();

    paintGame();

    deleteUsedItems();

    gameEngine();
}

