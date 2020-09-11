function category() {
  const category_list = document.getElementById("category-list");
  const category_links = document.getElementById("category-links");
  const category_link = document.querySelectorAll(".category-link");

  category_list.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color: lightgray;")
    category_links.setAttribute("style", "display: block;")
  });

  category_list.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color: lightgray;")
    category_links.removeAttribute("style", "display: block;")
  });


  category_link.forEach(function(list){
    list.addEventListener('mouseover', function(){
      this.setAttribute("style", "background-color: lightgray;")
    });

    list.addEventListener('mouseout', function(){
      this.removeAttribute("style", "background-color: lightgray;")
    });
  });
}
window.addEventListener("DOMContentLoaded", category)
