function createRandomArray(length, min, max){
    var array = [];
    for (let i = 0; i < array.length; i++) {
        array.push(randomNumber(min, max));        
    }
    return array;
}

function randomNumber(min, max){
   return Math.round(Math.random()*(max - min) + min);
}