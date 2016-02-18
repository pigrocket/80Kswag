//Number.prototype.clamp = function(min, max) {
//  return this < min ? min : (this > max ? max : this);
//};

//var snd = new Audio("https://dl.dropboxusercontent.com/u/15759969/Jump9.wav");

speed: 6,
velX: 16,
velY: 0,
jumping: false
friction = .9,
gravity = 1;


(function update() {
  // check keys

  // right arrow or d
  if (keys[39] || keys[68]) {
    if (player.velX < player.speed) {
      player.velX++;
      if (!player.jumping) {
        player.jumping = true;
        player.velY = -player.speed * 2;
        snd.play();
      }
    }
  }
  // left arrow or a
  if (keys[37] || keys[65]) {
    if (player.velX > -player.speed) {
      player.velX--;
      if (!player.jumping) {
        player.jumping = true;
        player.velY = -player.speed * 2;
        snd.play();
      }
    }
  }

  player.velX *= friction;
  player.velY += gravity;

  player.x += player.velX;
  player.y += player.velY;

  // keep in boundaries
  player.x = player.x.clamp(0, width - player.width);
  player.y = player.y.clamp(0, height - player.height);

  // ready to jump
  if (player.y >= height - player.height) {
    player.jumping = false;
  }

  ctx.clearRect(0, 0, width, height);
  ctx.fillStyle = player.color;
  ctx.fillRect(player.x, player.y, player.width, player.height);

  setTimeout(update, 1000 / 60);
}());

document.onkeydown = document.onkeyup = function(e) {
  keys[e.keyCode] = e.type === "keydown";
};

