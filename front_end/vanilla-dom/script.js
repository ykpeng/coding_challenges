document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants
  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const handleFavorite = (e) => {
    e.preventDefault();
    const input = document.querySelector(".favorite-input")
    const inputVal = input.value;
    input.value = "";

    const places = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = inputVal;
    places.appendChild(li);
  }
  const form = document.querySelector(".list-container");
  form.addEventListener("submit", handleFavorite)


  // adding new photos
  const photoForm = document.querySelector(".photo-form-container");
  const togglePhotoForm = (e)=> {
    if (photoForm.className.includes("hidden")) {
      photoForm.className = photoForm.className.replace("hidden", "");
    } else {
      photoForm.className = photoForm.className.concat(" hidden");
    }
  }
  const photoButton = document.querySelector(".photo-show-button");
  photoButton.addEventListener("click", togglePhotoForm)

  const handlePhotoSubmit = (e)=>{
    e.preventDefault();
    const li = document.createElement("li");
    const img = document.createElement("img");
    const input = document.querySelector(".photo-url-input");
    const inputVal = input.value;
    input.value = "";
    img.src = inputVal;
    li.appendChild(img);
    ul.appendChild(li);
  }
  const ul = document.querySelector(".dog-photos");
  photoForm.addEventListener("submit", handlePhotoSubmit)
});
