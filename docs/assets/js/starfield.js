/*
    Starfield lets you take a div and turn it into a starfield.

*/

// Define the starfield class.
function Starfield() {
  this.fps = 30;
  this.canvas = null;
  this.width = 0;
  this.width = 0;
  this.minVelocity = 15;
  this.maxVelocity = 30;
  this.stars = 100;
  this.intervalId = 0;
}

// The main function - initialises the starfield.
Starfield.prototype.initialise = function(div) {
  const self = this;

  // Store the div.
  this.containerDiv = div;
  self.width = window.innerWidth;
  self.height = window.innerHeight;

  window.onresize = function() {
    self.width = window.innerWidth;
    self.height = window.innerHeight;
    self.canvas.width = self.width;
    self.canvas.height = self.height;
    self.draw();
  };

  // Create the canvas.
  const canvas = document.createElement('canvas');
  div.appendChild(canvas);
  this.canvas = canvas;
  this.canvas.width = this.width;
  this.canvas.height = this.height;
};

Starfield.prototype.start = function() {

  // Create the stars.
  const stars = [];
  for(let i=0; i<this.stars; i++) {
    stars[i] = new Star(Math.random()*this.width, Math.random()*this.height, Math.random()*3+1,
      (Math.random()*(this.maxVelocity - this.minVelocity))+this.minVelocity);
  }
  this.stars = stars;

  const self = this;
  // Start the timer.
  this.intervalId = setInterval(() => {
    self.update();
    self.draw();
  }, 1000 / this.fps);
};

Starfield.prototype.stop = function() {
  clearInterval(this.intervalId);
};

Starfield.prototype.update = function() {
  const dt = 1 / this.fps;

  for(let i=0; i<this.stars.length; i++) {
    const star = this.stars[i];
    star.y += dt * star.velocity;
    // If the star has moved from the bottom of the screen, spawn it at the top.
    if(star.y > this.height) {
      this.stars[i] = new Star(Math.random()*this.width, 0, Math.random()*3+1,
        (Math.random()*(this.maxVelocity - this.minVelocity))+this.minVelocity);
    }
  }
};

Starfield.prototype.draw = function() {

  // Get the drawing context.
  const ctx = this.canvas.getContext('2d');

  // Draw the background.
  ctx.fillStyle = '#000000';
  ctx.fillRect(0, 0, this.width, this.height);

  // Draw stars.
  ctx.fillStyle = '#ffffff';
  for(let i=0; i<this.stars.length;i++) {
    const star = this.stars[i];
    ctx.fillRect(star.x, star.y, star.size, star.size);
  }
};

function Star(x, y, size, velocity) {
  this.x = x;
  this.y = y;
  this.size = size;
  this.velocity = velocity;
}
