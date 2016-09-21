function Game(){};

Game.prototype.start = function (inputElements) {
  let self = this;
  inputElements.forEach(function($el){
    $el.on("click", self.handleClick);
  });
};

Game.prototype.handleClick = function (e) {
  alert(`You clicked on ${$(this).text()}`);
};

$(()=>{
  let g = new Game();
  let left = $(".left");
  let right = $(".right");
  let bottom = $(".bottom");
  g.start([left, right, bottom]);

  let text = 'Hello World!';
  let div = document.getElementById('rollercoaster');
  let fontSize = 5;
  for (let i = 0; i < text.length; i++) {
    let span = document.createElement("SPAN");
    let letter = document.createTextNode(text[i])
    span.appendChild(letter);
    if (i <= Math.floor(text.length / 2)){
      fontSize += 5;
    } else {
      fontSize -= 5;
    }
    span.style.fontSize = `${fontSize}px`;
    div.appendChild(span);
  }

  // $(".input").on("input", function(){console.log($(this).val());})
  // let input = document.querySelector(".input");
  // input.addEventListener("input", function(e){
  //   console.log(this.value);
  // })
  //
  // function MyObject(element) {
  //   this.elm = element;
  //   element.addEventListener('click', this.onClick, false);
  // };
  //
  // MyObject.prototype.onClick = function(e){
  //   console.log(this);
  // }

  // let o = new MyObject(document.getElementById("practice"));

  const debounce = document.querySelector(".debounce");
  debounce.addEventListener("input", function(e){
    if (this.timeout) {
      clearTimeout(this.timeout);
    }
    this.timeout = setTimeout(function(){
      console.log(e.target.value);
    }, 200);
  })
  // $(".debounce").on("input", function(e){
  //   if (this.timeout) {
  //     clearTimeout(this.timeout);
  //   }
  //   this.timeout = setTimeout(function(){
  //     console.log(e.target.value);
  //   }, 200);
  // });
});
