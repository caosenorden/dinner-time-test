// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.onload = function(e){
  document.body.addEventListener("ajax:error", (event) => {
    const [data, status, xhr] = event.detail;
    document.querySelector(".error").innerHTML = data.error;
    document.querySelector(".error").classList.remove("hidden");
  });

  document.querySelector("form").addEventListener("keypress", (event) => {
    if(event.keyCode == 13){
      event.preventDefault();
      return false;
    };
  });

  document.querySelector("#ingredients_input").focus();
  document.querySelector("#ingredients_input").addEventListener("keyup", (event) => {
    if(event.keyCode === 13){
      const html = "<input type='checkbox' checked='checked' name='ingredients[]' id='ingredient-"+event.target.value+"' value='"+event.target.value+"'><label for='ingredient-"+event.target.value+"'><span>"+event.target.value+"</span></label"
      document.querySelector(".ingredients-list").insertAdjacentHTML("beforeend", html);
      document.querySelector(".ingredients-list").classList.remove("hidden");
      event.target.value = "";
    };
  });

  document.querySelector("a.add-ingredient").addEventListener("click", (event) => {
    event.preventDefault();
    event.stopPropagation();


  });
};

