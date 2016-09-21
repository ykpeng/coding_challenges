function debounce(func, wait, immediate) {
  return function() {
    const context = this,
    const args = arguments;
    const later = function () {
      let timeout = null;
      if (!immediate) {
        func.apply(context, args);
      }
    };
    const callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
    if (callNow) {
      func.apply(context, args);
    }
  };
};


$(document).ready(function() {
  $('input').keypress(function() {
    if (this.timeout) {
      clearTimeout(timeout);
    }
    this.timeout = setTimeout(function(){
      $.ajax({

      });
    }, 200);
  });
});
